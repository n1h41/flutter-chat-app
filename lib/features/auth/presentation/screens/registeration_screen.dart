import 'package:chat_app/core/presentation/widgets/textFields/form_text_field.dart';
import 'package:chat_app/core/presentation/widgets/textFields/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viemodels/registration_screen_state.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register account"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Form(
          key: registrationFormKey,
          child: Column(
            children: [
              FormTextField(
                fieldLabel: "First Name",
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return "Please enter your first name";
                  }
                  return '';
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormTextField(
                fieldLabel: "Last Name",
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return "Please enter your last name";
                  }
                  return '';
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormTextField(
                fieldLabel: "Email",
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return "Please enter a valid email";
                  }
                  return '';
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final bool obscurePassword = ref
                      .watch(registrationScreenViewModelProvider)
                      .obscurePassword;
                  return PasswordField(
                    onPressed: () {
                      ref
                          .read(registrationScreenViewModelProvider.notifier)
                          .togglePasswordVisibility = !obscurePassword;
                    },
                    fieldLabel: "Password",
                    obscurePassword: obscurePassword,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final bool obscurePassword = ref
                      .watch(registrationScreenViewModelProvider)
                      .obscureConfirmPassword;
                  return PasswordField(
                    onPressed: () {
                      ref
                          .read(registrationScreenViewModelProvider.notifier)
                          .toggleConfirmPasswordVisibility = !obscurePassword;
                    },
                    fieldLabel: "Confirm password",
                    obscurePassword: obscurePassword,
                  );
                },
              ),
              const Spacer(),
              SizedBox(
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
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
