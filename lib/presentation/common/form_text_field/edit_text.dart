import 'package:filmoow/presentation/common/form_text_field/text_input_status.dart';
import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  const EditText({
    required this.editTextController,
    required this.statusStream,
    this.focusNode,
    this.onChanged,
    this.emptyErrorMessage,
    this.invalidErrorMessage,
    this.labelText,
    this.keyboardType,
    this.textInputAction,
    this.onEditingComplete,
    this.obscureText,
    this.initialValue,
    this.hint,
    this.maxLines,
    this.enabled,
    this.autoFocus,
    this.suffixIcon,
    this.onSuffixIconPressed,
    Key? key,
  }) : super(key: key);

  final Stream<TextInputStatus> statusStream;
  final TextEditingController editTextController;
  final FocusNode? focusNode;
  final String? emptyErrorMessage;
  final String? invalidErrorMessage;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final bool? obscureText;
  final String? initialValue;
  final String? hint;
  final int? maxLines;
  final bool? enabled;
  final bool? autoFocus;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;

  @override
  Widget build(BuildContext context) => StreamBuilder<TextInputStatus>(
        stream: statusStream,
        builder: (context, snapshot) {
          final status = snapshot.data;
          String? errorMessage;

          if (status == TextInputStatus.invalid) {
            errorMessage = invalidErrorMessage ?? 'Campo inválido';
          } else if (status == TextInputStatus.empty) {
            errorMessage = emptyErrorMessage ?? 'Campo vazio';
          }

          return TextField(
            controller: editTextController,
            focusNode: focusNode,
            maxLines: maxLines,
            enabled: enabled,
            autofocus: autoFocus ?? false,
            decoration: InputDecoration(
              labelText: labelText,
              errorText: errorMessage,
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                icon: Icon(suffixIcon),
                onPressed: onSuffixIconPressed,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black87,
                ),
              ),
              hintText: hint,
            ),
            cursorColor: Colors.black87,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
          );
        },
      );
}
