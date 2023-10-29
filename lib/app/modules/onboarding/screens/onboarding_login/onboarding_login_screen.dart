import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/routes/jp_router.dart';
import 'package:justplay/app/services/notifications.dart';
import 'package:justplay/app/types/string_extensions.dart';
import 'package:justplay/app/widgets/inputs/jp_text_input.dart';
import 'package:justplay/app/widgets/inputs/jp_validators.dart';
import 'package:justplay/app/widgets/jp_button.dart';
import 'package:justplay/app/widgets/jp_exit_app.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';
import 'package:justplay/app/widgets/jp_tab.dart';
import 'package:justplay/core/services/i_auth_service.dart';
import 'package:justplay/injectable.dart';

@RoutePage()
class OnboardingLoginScreen extends StatefulWidget {
  const OnboardingLoginScreen({super.key});

  @override
  State<OnboardingLoginScreen> createState() => _OnboardingLoginScreenState();
}

class _OnboardingLoginScreenState extends State<OnboardingLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return JpScaffold(
      body: JpExitApp(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: JpTab(
            tabs: const [
              'Log In',
              'Sign Up',
            ],
            views: [
              Form(
                key: loginFormKey,
                onChanged: () {
                  setState(() {});
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    JpTextInput(
                      label: 'Email:',
                      validator: JpValidators.email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15.h),
                    JpTextInput(
                      label: 'Password:',
                      validator: JpValidators.password,
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 15.h),
                    JpButton(
                      text: 'Log In',
                      enabled: loginFormKey.currentState?.validate() ?? false,
                      onPressed: _login,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: signUpFormKey,
                onChanged: () {
                  setState(() {});
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    JpTextInput(
                      label: 'Email:',
                      validator: JpValidators.email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15.h),
                    JpTextInput(
                      label: 'Password:',
                      validator: JpValidators.password,
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 15.h),
                    JpTextInput(
                      label: 'First Name:',
                      validator: JpValidators.name,
                      controller: firstNameController,
                    ),
                    SizedBox(height: 15.h),
                    JpTextInput(
                      label: 'Last Name:',
                      validator: JpValidators.name,
                      controller: lastNameController,
                    ),
                    SizedBox(height: 15.h),
                    JpButton(
                      text: 'Sign Up',
                      enabled: signUpFormKey.currentState?.validate() ?? false,
                      onPressed: _register,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    try {
      await getIt<IAuthService>().login(
        email: emailController.text,
        password: passwordController.text,
      );
      JpNotification.success('Login successful');
      await appRouter.pushAndPopUntil(
        const ChargingRoute(),
        predicate: (route) => true,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        JpNotification.error(e.code.toCapitalize());
      } else {
        JpNotification.error('Unknown error');
      }
    }
  }

  Future<void> _register() async {
    try {
      await getIt<IAuthService>().register(
        name: '${firstNameController.text} ${lastNameController.text}',
        email: emailController.text,
        password: passwordController.text,
      );
      JpNotification.success('Registration successful');
      await appRouter.pushAndPopUntil(
        const ChargingRoute(),
        predicate: (route) => true,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        JpNotification.error(e.code.toCapitalize());
      } else {
        JpNotification.error('Unknown error');
      }
    }
  }
}
