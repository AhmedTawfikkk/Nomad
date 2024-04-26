import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;


  const CustomTextFormField(
      {super.key,
      this.labelText,
      this.obscureText = false,
      required this.controller,
      this.validator,
        this.readOnly = false,
        this.prefixIcon,
        this.suffixIcon
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xff233166),
            fontFamily: "DG Trika",
            fontSize: 12
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: Color(0xffe46409),
        prefixIconConstraints: const BoxConstraints(maxWidth: 50),
        suffixIcon: suffixIcon,
        suffixIconColor: Color(0xffe46409),
        suffixIconConstraints: const BoxConstraints(maxWidth: 50),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffE9824E),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffE9824E),
          ),
        ),
      ),
      onTap: !readOnly ? () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2023),
          lastDate: DateTime(2025),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          controller.text = formattedDate;
        }
      } : null,
    );
  }
}
