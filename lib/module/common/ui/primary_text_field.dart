import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final String label;
  final TextEditingController? controller;
  final bool passwordField;
  final bool emailField;
  final bool messageField;
  final bool usernameField;
  final Color? textColor;
  final Color? fillColor;

  const PrimaryTextField({
    Key? key,
    this.onChanged,
    this.controller,
    this.onEditingComplete,
    this.onSubmitted,
    this.passwordField = false,
    this.emailField = false,
    this.messageField = false,
    this.usernameField = false,
    this.textColor,
    required this.label,
    this.fillColor = const Color.fromRGBO(0, 0, 0, 0.3),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        border: const OutlineInputBorder(),
        hintText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(25),
        ),
        contentPadding: const EdgeInsets.all(21),
        hintStyle: TextStyle(color: textColor),
      ),
      keyboardType: emailField
          ? TextInputType.emailAddress
          : messageField
              ? TextInputType.multiline
              : null,
      obscureText: passwordField,
      maxLength: passwordField ? 60 : null,
      autocorrect: !usernameField && !emailField,
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      cursorColor: textColor,
      style: TextStyle(color: textColor),
      maxLines: messageField == true ? null : 1,
      textInputAction: onEditingComplete != null
          ? TextInputAction.next
          : messageField
              ? TextInputAction.newline
              : null,
    );
  }
}
