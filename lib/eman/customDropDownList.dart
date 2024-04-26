import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDropDownList<T> extends StatelessWidget {
  final String? labelText;
  final Widget? prefixIcon;
  final T value;   //T is type that could be specified when running the code
  final List<T> items;
  final ValueChanged<T?> onChanged;

  const CustomDropDownList({
    Key? key,
    this.labelText,
    this.prefixIcon,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xff233166),
          fontFamily: "DG Trika",
          fontSize: 12,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: Color(0xffe46409),
        prefixIconConstraints: const BoxConstraints(maxWidth: 50),
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
      items: items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
