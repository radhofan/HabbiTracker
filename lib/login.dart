import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'register.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorText;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login here',
              style: TextStyle(
                fontSize: 36,
                color: Color(0xFF6100ED),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Welcome back! you've\n been missed.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 300,
              height: 60,
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Color(0xFFE5D3FF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6100ED), width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 300,
              height: 60,
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Color(0xFFE5D3FF),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6100ED), width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 300,
              height: 60,
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6100ED),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 300,
              height: 400,
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (errorText != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        errorText!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text;

                      if (email.isEmpty || password.isEmpty) {
                        setState(() {
                          errorText = 'Email and password cannot be empty';
                        });
                        return;
                      }
                      setState(() {
                        errorText = null;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF6100ED),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(300, 60),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child:  Text(
                      'Create new account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Or continue with',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6100ED),
                    ),
                  ),
                  SizedBox(height: 15),
                  AuthButtonGroup(
                    style: AuthButtonStyle(
                      width: 50,
                      height: 50,
                      progressIndicatorType: AuthIndicatorType.linear,
                    ),
                    buttons: [
                      GoogleAuthButton(
                        onPressed: () {
                          setState(() {
                            isLoading = !isLoading;
                          });
                        },
                        isLoading: isLoading,
                        style: AuthButtonStyle(
                          //iconType: AuthIconType.secondary,
                          buttonType: AuthButtonType.icon,
                        ),
                      ),
                      AppleAuthButton(
                        onPressed: () {
                          setState(() {
                            isLoading = !isLoading;
                          });
                        },
                        isLoading: isLoading,
                        style: AuthButtonStyle(
                          //iconType: AuthIconType.secondary,
                          buttonType: AuthButtonType.icon,
                        ),
                      ),
                      FacebookAuthButton(
                        onPressed: () {
                          setState(() {
                            isLoading = !isLoading;
                          });
                        },
                        isLoading: isLoading,
                        style: AuthButtonStyle(
                          //iconType: AuthIconType.secondary,
                          buttonType: AuthButtonType.icon,
                        ),
                      ),
                    ],
                  ),
                ], //children
              ),
            ),
          ], // children
        ),
      ),
    );
  }
}



