import 'package:crafty/features/auth/ui/screen/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  static final String name = '/resetpassword';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordTEController =
      TextEditingController();
  final TextEditingController _confirmNewPasswordTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _setPasswordInProgress = false;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text('Set Password', style: textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(
                'Set a new password minimum length of 6 letters',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _newPasswordTEController,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(hintText: 'Password'),
                validator: (String? value) {
                  if ((value?.length ?? 0) < 6) {
                    return 'Password must 6 or more';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _confirmNewPasswordTEController,
                autovalidateMode: AutovalidateMode.disabled,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: 'COnfirm PAssword'),
                validator: (String? value) {
                  if ((value?.length ?? 0) < 6) {
                    return "Password must be at least 6 characters long";
                  } else if (value != _newPasswordTEController.text) {
                    return "Confirm password doesn't match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Visibility(
                  visible: _setPasswordInProgress == false,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: ElevatedButton(
                    onPressed: () {
                      _onTapSubmitInButtn();
                    },
                    child: Text('Confirm'),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    children: [
                      const TextSpan(text: 'Have account? '),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapSignInButtn,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSubmitInButtn() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _resetPassword();
  }

  Future<void> _resetPassword() async {
    if (mounted) {
      setState(() {
        _setPasswordInProgress = true;
      });
    }
    if (!mounted) return;

    // Schedule navigation for the next microtask to avoid race conditions
    Future.microtask(() {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.name,
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _newPasswordTEController.dispose();
    _confirmNewPasswordTEController.dispose();
    super.dispose();
  }

  void _onTapSignInButtn() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.name,
      (route) => false,
    );
  }
}
