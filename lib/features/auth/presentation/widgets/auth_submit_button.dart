import 'package:flutter/material.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton(
      {super.key,
      required bool isLoading,
      required VoidCallback submitForm,
      required String buttonText})
      : _submitForm = submitForm,
        _isLoading = isLoading,
        _buttonText = buttonText;

  final bool _isLoading;
  final VoidCallback _submitForm;
  final String _buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        onPressed: _isLoading ? null : _submitForm,
        child: _isLoading
            ? const CircularProgressIndicator()
            : Text(_buttonText),
      ),
    );
  }
}
