import 'package:flutter/material.dart';
import 'edit_code_page.dart';

class InitializeGitRepoPage extends StatefulWidget {
  const InitializeGitRepoPage({Key? key}) : super(key: key);

  @override
  _InitializeGitRepoPageState createState() => _InitializeGitRepoPageState();
}

class _InitializeGitRepoPageState extends State<InitializeGitRepoPage> {
  String _selectedRepo = 'Repo 1';
  String _selectedDirectory = 'Directory 1';
  String _selectedFile = 'File 1.c';

  final List<String> _repos = ['Repo 1', 'Repo 2', 'Repo 3'];
  final List<String> _directories = ['Directory 1', 'Directory 2', 'Directory 3'];
  final List<String> _files = ['File 1.c', 'File 2.c', 'File 3.c'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initialize Git Repository'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select a repository',
                border: OutlineInputBorder(),
              ),
              value: _selectedRepo,
              items: _repos.map((repo) => DropdownMenuItem(value: repo, child: Text(repo))).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRepo = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select a directory',
                border: OutlineInputBorder(),
              ),
              value: _selectedDirectory,
              items: _directories.map((directory) => DropdownMenuItem(value: directory, child: Text(directory))).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDirectory = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select a file',
                border: OutlineInputBorder(),
              ),
              value: _selectedFile,
              items: _files.map((file) => DropdownMenuItem(value: file, child: Text(file))).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFile = value!;
                });
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCodePage(filePath: 'assets/main.c'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: Icon(Icons.add_to_home_screen),
              label: const Text(
                'Edit',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
