import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:justplay/app/widgets/inputs/jp_text_input.dart';
import 'package:justplay/app/widgets/inputs/jp_validators.dart';
import 'package:justplay/app/widgets/jp_button.dart';
import 'package:justplay/app/widgets/jp_scaffold.dart';
import 'package:justplay/app/widgets/jp_tab.dart';

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
      body: Padding(
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
                  ),
                  SizedBox(height: 15.h),
                  JpTextInput(
                    label: 'Password:',
                    validator: JpValidators.password,
                    controller: passwordController,
                  ),
                  SizedBox(height: 15.h),
                  JpButton(
                    text: 'Log In',
                    enabled: loginFormKey.currentState?.validate() ?? false,
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
                  ),
                  SizedBox(height: 15.h),
                  JpTextInput(
                    label: 'Password:',
                    validator: JpValidators.password,
                    controller: passwordController,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
