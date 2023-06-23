// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/routes/router_utils.dart';
import 'package:chat_app/core/widgets/textFields/form_text_field.dart';
import 'package:chat_app/features/auth/domain/usecases/login_user.dart';
import 'package:chat_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_submit_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends HookConsumerWidget {
  void _submitLoginForm(WidgetRef ref, LoginUserParams params) async {
    await ref.read(authControllerProvider.notifier).loginUser(params);
  }

  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormStateKey = useMemoized(GlobalKey<FormState>.new);
    final TextEditingController email = useTextEditingController();
    final TextEditingController password = useTextEditingController();
    ref.listen(authControllerProvider, (_, next) {
      next.maybeWhen(
        authenticated: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User logged in successfully'),
            ),
          );
          context.goNamed(APP_PAGES.homeView.routeName);
        },
        error: (e) {
          if (e is ServerFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message!),
                showCloseIcon: true,
                closeIconColor: Colors.white,
              ),
            );
          }
          return null;
        },
        orElse: () => null,
      );
    });
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '🇬🇧'),
                        WidgetSpan(
                          child: SizedBox(
                            width: 5.w,
                          ),
                        ),
                        TextSpan(
                          text: 'ENG',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to\nChatinc',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 42.sp,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                  TextSpan(
                    text: '👋',
                    style: TextStyle(
                      fontSize: 30.sp,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),
                child: Form(
                  key: loginFormStateKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 15.h,
                        ),
                        Text(
                          'Enter your Email',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        FormTextField(
                          iconAvailable: true,
                          icon: Icon(
                            Icons.email_outlined,
                          ),
                          fieldLabel: 'Email',
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
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Enter your password',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        PasswordField(
                          fieldLabel: 'Password',
                          controller: password,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Or',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.h,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(22),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'Phone number',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.h,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(22.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/socialMedia/google-logo.svg',
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'Google',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.h,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(22.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/socialMedia/facebook-logo.svg',
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text("Don't have an account ?"),
                            TextButton(
                              onPressed: () {
                                context
                                    .goNamed(APP_PAGES.registerView.routeName);
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.blueAccent.shade700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Consumer(
                            builder: (context, ref, child) {
                              final state = ref.watch(authControllerProvider);
                              return AuthSubmitButton(
                                isLoading: state.maybeWhen(
                                  loading: () => true,
                                  orElse: () => false,
                                ),
                                submitForm: () {
                                  {
                                    if (loginFormStateKey.currentState!
                                        .validate()) {
                                      loginFormStateKey.currentState!.save();
                                      final LoginUserParams params =
                                          LoginUserParams(
                                        email: email.text,
                                        password: password.text,
                                      );
                                      return _submitLoginForm(ref, params);
                                    }
                                  }
                                },
                                buttonText: "Continue",
                              );
                            },
                            child: AuthSubmitButton(
                              isLoading: false,
                              submitForm: () {
                                {
                                  if (loginFormStateKey.currentState!
                                      .validate()) {
                                    loginFormStateKey.currentState!.save();
                                    final LoginUserParams params =
                                        LoginUserParams(
                                      email: email.text,
                                      password: password.text,
                                    );
                                    return _submitLoginForm(ref, params);
                                  }
                                }
                              },
                              buttonText: "Continue",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        /* floatingActionButton: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(authControllerProvider);
            return AuthSubmitButton(
              isLoading: state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
              submitForm: () {
                {
                  if (loginFormStateKey.currentState!.validate()) {
                    loginFormStateKey.currentState!.save();
                    final LoginUserParams params = LoginUserParams(
                      email: email.text,
                      password: password.text,
                    );
                    return _submitLoginForm(ref, params);
                  }
                }
              },
              buttonText: "Continue",
            );
          },
          child: AuthSubmitButton(
            isLoading: false,
            submitForm: () {
              {
                if (loginFormStateKey.currentState!.validate()) {
                  loginFormStateKey.currentState!.save();
                  final LoginUserParams params = LoginUserParams(
                    email: email.text,
                    password: password.text,
                  );
                  return _submitLoginForm(ref, params);
                }
              }
            },
            buttonText: "Continue",
          ),
        ), */
      ),
    );
  }
}
