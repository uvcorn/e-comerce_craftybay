import 'package:crafty/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});
  static final String name = '/emailverify';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool _emailVerificationInProgress = false;
  // bool get emailVerificationInProgress => _emailVerificationInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 80),
            Text(
              'Your Email Address',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              'A 6 digit verification pin will be sent to your email.',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: _emailTEController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 16),
            Visibility(
              visible: _emailVerificationInProgress == false,
              replacement: CircularProgressIndicator(),
              child: ElevatedButton(
                onPressed: _onTapSubmitButton,
                child: const Icon(Icons.arrow_circle_right_outlined),
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
                    const TextSpan(text: "Have account? "),
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _onTapSignInButton,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    _sendOTPtoEmail();
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  Future<void> _sendOTPtoEmail() async {
    _emailVerificationInProgress = true;
    setState(() {});

    // NetworkResponse response = await NetworkClient.getRequest(
    //   url: Urls.sendOtptoEmail(_emailTEController.text.trim()),
    // );

    _emailVerificationInProgress = false;
    setState(() {});
    Navigator.pushNamed(context, OtpVerificationScreen.name);
    // if (response.isSuccess) {
    //   Navigator.pushNamed(context, LoginScreen.name);
    // } else {
    //  showSnackBarMessage(context, response.errorMessage, true);
    // }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
