import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> {
  bool _flag1 = false;
  bool _flag2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cuate.png',
              width: 350,
              height: 350,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Habbit Tracker',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF6100ED),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Easily track your daily habits and see real\n progress over time.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _flag1 = !_flag1;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()), // 👈 replace with your page widget
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: _flag1 ? Color(0xBF6100ED) : Color(0xFF6100ED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(100, 50),
                  ), //TextButton.styleFrom
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color:  Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 25),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _flag2 = !_flag2;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()), // 👈 replace with your page widget
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: _flag2 ? Colors.grey.shade200 : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(100, 50),
                  ), //TextButton.styleFrom
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ], // children
        ),
      ),
    );
  }
}