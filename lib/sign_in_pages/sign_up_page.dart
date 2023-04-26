import 'package:flutter/material.dart';
import '../main_pages/initialize_git_repo_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: 'Please enter your information below:',
              onChanged: (String? value) {
                // TODO: Handle authentication method change
              },
              items: <String>[
                'Please enter your information below:',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmedController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                final password = _passwordController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InitializeGitRepoPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Sign up',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    // Navigate to terms and conditions page
                  },
                  child: Text('Terms and Conditions'),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    // Navigate to privacy policy page
                  },
                  child: Text('Privacy Policy'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
