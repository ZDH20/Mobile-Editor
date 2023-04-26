import 'package:flutter/material.dart';
import '../main_pages/initialize_git_repo_page.dart';

class FacebookSignInPage extends StatefulWidget {
  const FacebookSignInPage({Key? key}) : super(key: key);

  @override
  _FacebookSignInPageState createState() => _FacebookSignInPageState();
}

class _FacebookSignInPageState extends State<FacebookSignInPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in with Facebook'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: 'Username and Password',
              onChanged: (String? value) {
                // TODO: Handle authentication method change
              },
              items: <String>[
                'Username and Password',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Facebook username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Facebook password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                Text('Remember Me'),
              ],
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
                'Sign in',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate to password recovery page
              },
              child: Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to GitHub sign-up page
              },
              child: Text('Sign up for Facebook'),
            ),
            // DropdownButton<String>(
            //   value: 'Username and Password',
            //   onChanged: (String? value) {
            //     // TODO: Handle authentication method change
            //   },
            //   items: <String>[
            //     'Username and Password',
            //     'OAuth',
            //     'Personal Access Token',
            //   ].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
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
