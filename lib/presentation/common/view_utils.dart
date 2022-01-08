import 'package:domain/exceptions.dart';
import 'package:filmoow/presentation/common/form_text_field/text_input_status.dart';
import 'package:flutter/material.dart';

extension DialogUtils on Widget {
  Future<T> showAsDialog<T>(
    BuildContext context, {
    bool isMaterialDismissible = true,
  }) async =>
      await showDialog(
        context: context,
        builder: (_) => this,
        barrierDismissible: isMaterialDismissible,
      );
}

extension FutureViewUtils on Future<dynamic> {
  Future<void> addStatusToSink(Sink<TextInputStatus> sink) => then(
        (_) {
      sink.add(TextInputStatus.valid);
      return null;
    },
  ).catchError(
        (error) {
      sink.add(error is EmptyFormFieldException
          ? TextInputStatus.empty
          : TextInputStatus.invalid);
    },
  );
}

//Sempre que o foco é perdido, da um trigger no listener
extension FocusNodeViewUtils on FocusNode {
  void addFocusLostListener(VoidCallback listener) {
    addListener(
          () {
        if (!hasFocus) {
          listener();
        }
      },
    );
  }
}