import 'package:chat_app/features/auth/domain/usecases/register_user.dart';
import 'package:chat_app/features/auth/presentation/register/controller/module.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/widgets/textFields/form_text_field.dart';

class RegistrationView extends HookConsumerWidget {
  const RegistrationView({super.key});

  void _submitRegistrationForm(RegisterUserParams params, WidgetRef ref) async {
    await ref
        .read(registrationViewControllerProvider.notifier)
        .registerUser(params);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registrationFormStateKey = useMemoized(GlobalKey<FormState>.new);
    final firstName = useTextEditingController();
    final lastName = useTextEditingController();
    final email = useTextEditingController();
    final password = useTextEditingController();
    final confirmPassword = useTextEditingController();
    ref.listen(registrationViewControllerProvider, (prev, next) {
      next.maybeWhen(
        data: () => context.goNamed('userVerificationScreen'),
        error: (e) {
          if (e is ServerFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message!),
                showCloseIcon: true,
              ),
            );
          }
          return null;
        },
        orElse: () => null,
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register account"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Form(
          key: registrationFormStateKey,
          child: Column(
            children: [
              FormTextField(
                iconAvailable: false,
                controller: firstName,
                fieldLabel: "First Name",
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return "Please enter your first name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormTextField(
                iconAvailable: false,
                controller: lastName,
                fieldLabel: "Last Name",
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return "Please enter your last name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormTextField(
                iconAvailable: false,
                controller: email,
                fieldLabel: "Email",
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              PasswordField(
                controller: password,
                fieldLabel: "Password",
              ),
              const SizedBox(
                height: 10,
              ),
              PasswordField(
                controller: confirmPassword,
                fieldLabel: "Confirm password",
              ),
              const Spacer(),
              Consumer(
                builder: (context, ref, child) {
                  final bool isLoading =
                      ref.watch(registrationViewControllerProvider).maybeMap(
                            loading: (value) => true,
                            orElse: () => false,
                          );
                  return AuthSubmitButton(
                    isLoading: isLoading,
                    submitForm: () {
                      if (registrationFormStateKey.currentState!.validate()) {
                        registrationFormStateKey.currentState!.save();
                        final params = RegisterUserParams(
                          firstName: firstName.text,
                          lastName: lastName.text,
                          email: email.text,
                          password: password.text,
                          passwordConfirmation: confirmPassword.text,
                        );
                        return _submitRegistrationForm(params, ref);
                      }
                    },
                    buttonText: 'Register',
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
