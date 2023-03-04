import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.onPressed,
    required this.fieldLabel,
    this.obscurePassword = false,
  });

  final String fieldLabel;
  final bool obscurePassword;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 6) {
          return "Invalid password";
        }
        return null;
      },
      obscureText: obscurePassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        contentPadding: const EdgeInsets.all(10),
        labelText: fieldLabel,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
