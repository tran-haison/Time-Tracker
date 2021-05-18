import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_model.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class EmailSignInBloc {
  EmailSignInBloc({
    @required this.authBase,
  });

  final AuthBase authBase;
  final StreamController<EmailSignInModel> _modelController =
      StreamController<EmailSignInModel>();
  EmailSignInModel _model = EmailSignInModel();

  Stream<EmailSignInModel> get modelStream => _modelController.stream;

  Future<void> submit() async {
    updateWith(
      isSubmitted: true,
      isLoading: true,
    );

    try {
      if (_model.formType == EmailSignInFormType.signIn) {
        await authBase.signInWithEmailAndPassword(
            _model.email, _model.password);
      } else {
        await authBase.createUserWithEmailAndPassword(
            _model.email, _model.password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = _model.formType == EmailSignInFormType.signIn
        ? EmailSignInFormType.register
        : EmailSignInFormType.signIn;
    updateWith(
      email: '',
      password: '',
      isSubmitted: false,
      isLoading: false,
      formType: formType,
    );
  }

  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool isSubmitted,
  }) {
    // update stream controller with new model
    _model = _model.copyWith(
      email: email,
      password: password,
      formType: formType,
      isLoading: isLoading,
      isSubmitted: isSubmitted,
    );

    _modelController.add(_model);
  }

  void dispose() => _modelController.close();
}
