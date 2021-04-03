import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/form_submit_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

enum EmailSignInFormType {
  signIn,
  register,
}

class EmailSignInForm extends StatefulWidget {
  final AuthBase authBase;

  const EmailSignInForm({
    @required this.authBase,
    Key key,
  }) : super(
          key: key,
        );

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get _email => _emailController.text;

  String get _password => _passwordController.text;

  var _emailSignInFormType = EmailSignInFormType.signIn;

  void _submit() async {
    try {
      if (_emailSignInFormType == EmailSignInFormType.signIn) {
        await widget.authBase.signInWithEmailAndPassword(_email, _password);
      } else {
        await widget.authBase.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void _toggleFormType() {
    setState(() {
      _emailSignInFormType = _emailSignInFormType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });

    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText = _emailSignInFormType == EmailSignInFormType.signIn
        ? "Sign in"
        : "Create an account";
    final secondaryText = _emailSignInFormType == EmailSignInFormType.signIn
        ? "Need an account? Register"
        : "Have an account? Sign in";

    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "example@example.com",
        ),
      ),
      SizedBox(height: 8),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: "Password",
        ),
        obscureText: true,
      ),
      SizedBox(height: 8),
      FormSubmitButton(
        text: primaryText,
        onPressed: _submit,
      ),
      SizedBox(height: 8),
      FlatButton(
        onPressed: _toggleFormType,
        child: Text(secondaryText),
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
