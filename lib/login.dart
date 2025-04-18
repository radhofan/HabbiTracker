import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  bool isLoading = false;

  // AuthButtonType buttonType = AuthButtonType.icon;
  // AuthIconType iconType = AuthIconType.outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login here',
              style: TextStyle(
                fontSize: 36,
                color: Colors.purple,
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
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.purple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
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
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.purple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
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
                      color: Colors.purple.shade800,
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
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.purple,
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
                  Text(
                    'Create new account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Or continue with',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.purple.shade800,
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



