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
      height: 50,
      width: 130,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
        ),
        onPressed: _isLoading ? null : _submitForm,
        child:
            _isLoading ? const CircularProgressIndicator() : Text(_buttonText),
      ),
    );
  }
}
