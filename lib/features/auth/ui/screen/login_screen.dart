import 'package:crafty/features/auth/ui/widgets/app_logo.dart';
import 'package:crafty/features/common/ui/screens/main_bottom_nav_screen.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
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
                  const SizedBox(height: 44),
                  AppLogo(width: 90, hight: 90),
                  const SizedBox(height: 16),
                  Text('Welcome Back', style: textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    'Please Enter Your email & password',
                    style: textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
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
                    textInputAction: TextInputAction.done,
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
                  ElevatedButton(
                    onPressed: _onTapLoginButton,
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainBottomNavScreen.name,
      (predicate) => false,
    );
    // if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
