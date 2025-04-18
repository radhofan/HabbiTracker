import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {

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
            SizedBox(height: 65),
            Text(
              'Create Account',
              style: TextStyle(
                fontSize: 36,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Create an account so you can explore all the\n existing jobs",
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
            SizedBox(height: 15),
            Container(
              width: 300,
              height: 60,
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.purple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
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
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Already Have an Account',
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



