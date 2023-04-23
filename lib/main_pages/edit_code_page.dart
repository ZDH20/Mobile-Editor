import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditCodePage extends StatefulWidget {
  const EditCodePage({Key? key, required this.filePath}) : super(key: key);

  final String filePath;

  @override
  _EditCodePageState createState() => _EditCodePageState();
}

class _EditCodePageState extends State<EditCodePage> {
  late TextEditingController _controller;
  bool _wrapWords = false;
  String _selectedSnippet = '';

  @override
  void initState() {
    super.initState();
    _loadCode().then((code) {
      setState(() {
        _controller = TextEditingController(text: code);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> _loadCode() async {
    return await rootBundle.loadString(widget.filePath);
  }

  void _toggleWrapWords() {
    setState(() {
      _wrapWords = !_wrapWords;
    });
  }

  void _onSnippetSelected(String snippet) {
    setState(() {
      _selectedSnippet = snippet;
      _insertSnippet(snippet);
    });
  }

  void _insertSnippet(String snippet) {
    final cursorPosition = _controller.selection.start;
    final textBeforeCursor = _controller.text.substring(0, cursorPosition);
    final textAfterCursor = _controller.text.substring(cursorPosition);
    final newText = '$textBeforeCursor$snippet$textAfterCursor';
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        offset: cursorPosition + snippet.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      // Show a loading indicator while the code is being loaded
      return Scaffold(
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final lines = _controller.text.split('\n');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Code'),
        actions: [
          PopupMenuButton<String>(
            onSelected: _onSnippetSelected,
            itemBuilder: (BuildContext context) {
              return ['for', 'while', 'if', 'if-else-if', 'if-else', 'switch', 'void fn(void)', 'void fn(param)', 'int fn(void)', 'int fn(param)', 'include', 'define',
              ].map((snippet) {
                return PopupMenuItem<String>(
                  value: snippet,
                  child: Text(snippet),
                );
              }).toList();
            },
            child: Icon(Icons.code),
          ),
          IconButton(
            icon: Icon(_wrapWords ? Icons.wrap_text : Icons.wrap_text_outlined),
            onPressed: _toggleWrapWords,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: lines.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display line number
                Text(
                  '${index + 1}'.padLeft(3) + '  ',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: lines[index]),
                    keyboardType: TextInputType.multiline,
                    maxLines: _wrapWords ? null : 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                    onChanged: (value) {
                      lines[index] = value;
                      _controller.text = lines.join('\n');
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
