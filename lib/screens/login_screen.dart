import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../tools/custom_widget/email_text_field.dart';

import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  String email = '';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Container(
          height: 500.0,
          width: 500.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              EmailTextField(onTextChanged: (String value) {
                setState(() {
                  email = value;
                });
              }),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  await authProvider.login(username, password, email);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
