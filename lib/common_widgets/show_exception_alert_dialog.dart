import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/show_alert_dialog.dart';

Future<void> showExceptionAlertDialog({
  BuildContext context,
  @required String title,
  @required Exception exception,
}) {
  showAlertDialog(
    context: context,
    title: title,
    content: _message(exception),
    defaultActionText: "Ok",
  );
}

String _message(Exception exception) {
  if (exception is FirebaseAuthException) {
    return exception.message;
  } else {
    return exception.toString();
  }
}