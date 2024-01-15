import 'package:flutter/material.dart';


class EmailTextField extends StatefulWidget {

  final void Function(String) onTextChanged;
  const EmailTextField({super.key, required this.onTextChanged});

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final TextEditingController _emailController = TextEditingController();
  final RegExp _emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  bool _isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'E-mail',
            hintText: 'example@mail.com',
            prefixIcon: const Icon(Icons.email),
            errorText: _isEmailValid ? null : 'Invalid email',
          ),
          onChanged: (value) {
            setState(() {
              _isEmailValid = _emailRegExp.hasMatch(value);
              widget.onTextChanged(value);
            });
          },
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}