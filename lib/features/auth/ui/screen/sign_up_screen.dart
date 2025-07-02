// ignore_for_file: use_build_context_synchronously

import 'package:crafty/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty/core/ui/widgets/snack_bar_message.dart';
import 'package:crafty/features/auth/data/models/sign_up_request_model.dart';
import 'package:crafty/features/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty/features/auth/ui/screen/verify_otp_screen.dart.dart';
import 'package:crafty/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static final String name = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final SignUpController _signUpController = Get.find<SignUpController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppLogo(width: 90, hight: 90),
                  const SizedBox(height: 16),
                  Text('Register Account', style: textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    'Please enter your details',
                    style: textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _firstNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _lastNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Last Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _mobileTEController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Mobile'),
                    validator: (String? value) {
                      String phone = value?.trim() ?? '';
                      RegExp regExp = RegExp(r'^(?:\+88|0088)?01[13-9]\d{8}$');
                      if (!regExp.hasMatch(phone)) {
                        return 'Enter a valid phone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (String? value) {
                      String emailValue = value ?? '';
                      if (EmailValidator.validate(emailValue) == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value) {
                      if ((value?.length ?? 0) < 6) {
                        return 'Password must 6 or more';
                      }
                      return null;
                    },
                    // onEditingComplete: _onTapLoginButton,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _cityTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'City'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid City';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: _addressTEController,
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(6),
                      hintText: 'Shipping Address',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a Shipping address';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  GetBuilder<SignUpController>(
                    builder: (_) {
                      return Visibility(
                        visible: _signUpController.inProgress == false,
                        replacement: CenteredCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTapSignupButton,
                          child: Text('Register'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 11),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSignupButton() async {
    if (_formKey.currentState!.validate()) {
      final SignUpRequestModel model = SignUpRequestModel(
        email: _emailTEController.text.trim(),
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        password: _passwordTEController.text,
        city: _cityTEController.text.trim(),
        phone: _mobileTEController.text.trim(),
      );
      final bool isSuccess = await _signUpController.signUp(model);
      if (!mounted) return;
      if (isSuccess) {
        showSnackBarMessage(context, _signUpController.message);
        Navigator.pushNamed(
          context,
          VerifyOtpScreen.name,
          arguments: _emailTEController.text.trim(),
        );
      } else {
        showSnackBarMessage(context, _signUpController.errorMessage!, true);
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _addressTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
