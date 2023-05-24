// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key? key,
    required this.fieldLabel,
    required this.validator,
    required this.controller,
    required this.iconAvailable,
    this.icon,
  }) : super(key: key);

  final String fieldLabel;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool iconAvailable;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        contentPadding: const EdgeInsets.all(10),
        labelText: fieldLabel,
        labelStyle: const TextStyle(fontSize: 15),
        prefixIcon: iconAvailable ? icon : null,
      ),
    );
  }
}
