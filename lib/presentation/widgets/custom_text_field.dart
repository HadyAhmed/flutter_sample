import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/utils/extensions/size_utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.keyboardType,
    this.textInputAction,
    required this.controller,
    this.hint,
    this.label,
    this.error,
    this.widthPercentage,
    this.obscureText = false,
    this.autocorrect = false,
    this.inputFormatters,
    this.onChanged,
    this.maxLength,
  }) : super(key: key);

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final String? hint, label, error;
  final double? widthPercentage;
  final bool obscureText, autocorrect;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidthPercentage(widthPercentage ?? 80),
      child: TextFormField(
        obscureText: obscureText,
        autocorrect: autocorrect,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        controller: controller,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          errorText: error,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
