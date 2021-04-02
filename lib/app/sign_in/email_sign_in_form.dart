import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "example@example.com",
        ),
      ),
      SizedBox(height: 8),
      TextField(
        decoration: InputDecoration(
          labelText: "Password",
        ),
        obscureText: true,
      ),
      SizedBox(height: 8),
      FormSubmitButton(
        text: "Sign in",
        onPressed: () {},
      ),
      SizedBox(height: 8),
      FlatButton(
        onPressed: () {},
        child: Text("Need an account? Register"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
