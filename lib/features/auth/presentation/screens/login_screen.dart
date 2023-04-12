import '../../domain/usecases/login_user.dart';
import '../viewModels/loginScreen/login_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/widgets/textFields/form_text_field.dart';
import '../viewModels/loginScreen/login_screen_state.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/password_field.dart';

class LoginScreen extends HookConsumerWidget {
  void _submitLoginForm(WidgetRef ref, LoginUserParams params) async {
    await ref.read(loginScreenNotifierProvider.notifier).login(params);
  }

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormStateKey = useMemoized(GlobalKey<FormState>.new);
    final email = useTextEditingController();
    final password = useTextEditingController();
    ref.listen(loginScreenNotifierProvider, (prev, next) {
      if (next.stateType == LoginScreenStateType.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Logged in as ${next.user!.firstName}',
            ),
            showCloseIcon: true,
          ),
        );
        context.go('/home');
      }
      if (next.stateType == LoginScreenStateType.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              next.error.toString(),
            ),
          ),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Form(
          key: loginFormStateKey,
          child: Column(
            children: [
              FormTextField(
                fieldLabel: "Email ID",
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                controller: email,
              ),
              const SizedBox(
                height: 10,
              ),
              PasswordField(
                controller: password,
                fieldLabel: "Password",
              ),
              const Spacer(),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(loginScreenNotifierProvider);
                  final bool isLoading =
                      state.stateType == LoginScreenStateType.loading;
                  return AuthSubmitButton(
                    isLoading: isLoading,
                    submitForm: () {
                      if (loginFormStateKey.currentState!.validate()) {
                        loginFormStateKey.currentState!.save();
                        final LoginUserParams params = LoginUserParams(
                          email: email.text,
                          password: password.text,
                        );
                        return _submitLoginForm(ref, params);
                      }
                    },
                    buttonText: 'Login',
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      context.goNamed('registrationScreen');
                    },
                    child: const Text('Register'),
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
