import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'service/api_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String? errorText;
  String? successText;
  bool isLoading = false;

  Future<void> registerUser() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        errorText = 'Please fill all fields';
        successText = null;
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        errorText = 'Passwords do not match';
        successText = null;
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorText = null;
      successText = null;
    });

    try {
      await ApiService.createUser(
        name: name,
        email: email,
        password: password,
      );

      setState(() {
        successText = 'Registration successful!';
        errorText = null;
      });
    } catch (e) {
      setState(() {
        errorText = e.toString();
        successText = null;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget textField(String label, TextEditingController controller, {bool obscure = false}) {
    return Container(
      width: 300,
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xFFE5D3FF),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF6100ED), width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 65),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFF6100ED),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Create an account so you can explore all the\nexisting jobs",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              textField('Full Name', nameController),
              textField('Email', emailController),
              textField('Password', passwordController, obscure: true),
              textField('Confirm Password', confirmPasswordController, obscure: true),
              const SizedBox(height: 12),
              if (errorText != null)
                Text(errorText!, style: const TextStyle(color: Colors.red)),
              if (successText != null)
                Text(successText!, style: const TextStyle(color: Colors.green)),
              const SizedBox(height: 12),
              TextButton(
                onPressed: isLoading ? null : registerUser,
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF6100ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(300, 60),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Or continue with',
                style: TextStyle(color: Color(0xFF6100ED)),
              ),
              const SizedBox(height: 15),
              AuthButtonGroup(
                style: const AuthButtonStyle(
                  width: 50,
                  height: 50,
                  progressIndicatorType: AuthIndicatorType.linear,
                ),
                buttons: [
                  GoogleAuthButton(
                    onPressed: () {},
                    style: const AuthButtonStyle(buttonType: AuthButtonType.icon),
                  ),
                  AppleAuthButton(
                    onPressed: () {},
                    style: const AuthButtonStyle(buttonType: AuthButtonType.icon),
                  ),
                  FacebookAuthButton(
                    onPressed: () {},
                    style: const AuthButtonStyle(buttonType: AuthButtonType.icon),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
