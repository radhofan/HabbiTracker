import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'dashboard.dart';
import 'welcome.dart';
import 'profile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}
class _DashboardPageState extends State<DashboardPage> {
  late AnimationController controller;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              break;
          }
        },
        selectedIndex: 0,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'New Habit',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Text(
                    'Welcome to\nHabbiTracker!',
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    height: 200,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 16 ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/heart-new.png',
                              width: 40,
                              height: 35,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "You are healthy",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ], // children
                            ),
                          ], // children
                        ),
                        SizedBox(height: 12),
                        Container(
                          margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '95%',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 124,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 4),
                                            Icon(
                                              Icons.circle,
                                              color: Colors.green,
                                              size: 12.0,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Increased +10%',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Keep it up, almost there just a little more',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: 0.7,
                                semanticsLabel: 'Achieved',
                                minHeight: 20,
                              ),
                            ], // children
                          ),
                        ),
                        SizedBox(height: 8),
                      ], // children
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Activity Summary',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 142,
                        width: 142,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            width: 8,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/sepatu-new.png',
                                      width: 40,
                                      height: 30,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      'Steps taken',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ], // children
                                ),
                              ], // children
                            ),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '12000',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ), // TextStyle
                                ), // Text
                                SizedBox(width: 3),
                                Text(
                                  'Steps',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ), // TextStyle
                                ), // Text
                              ]
                            ),
                            SizedBox(height: 8),
                            Text(
                              '8% more than the average people',
                              style: TextStyle(
                                fontSize: 7,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ), // TextStyle
                            ), // Text
                          ], // children
                        ),
                      ),
                      SizedBox(width: 24),
                      Container(
                        height: 142,
                        width: 142,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            width: 8,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/api-new.png',
                                  width: 40,
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: 1),
                                Text(
                                  'Calories',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ], // children
                            ),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '696',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ), // TextStyle
                                  ), // Text
                                  SizedBox(width: 3),
                                  Text(
                                    'KCal',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]
                            ),
                            SizedBox(height: 8),
                            Text(
                              '5% more than the average people',
                              style: TextStyle(
                                fontSize: 7,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ], // children
                        ),
                      ),
                    ], // children
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 120,
                    width: 310,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                        width: 8,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/goals-new.png',
                              width: 40,
                              height: 35,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your daily goals',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Last 7 days',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ], // children
                            ),
                          ], // children
                        ),
                        SizedBox(height: 6),
                        Container(
                          margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Achieved', style: TextStyle(fontSize: 12)),
                              SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: 0.7,
                                semanticsLabel: 'Achieved',
                              ),
                            ], // children
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              spacing: 18,
                              children: [
                                for (var i = 1; i <= 7; i++)
                                  Icon(
                                    Icons.check_circle,
                                    color: i % 2 == 0 ? Colors.green : Colors.red,
                                    size: 20.0,
                                  ),
                              ],
                            ),
                          ],
                        )
                      ], // children
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 142,
                        width: 142,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            width: 8,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/sepatu-new.png',
                                      width: 40,
                                      height: 30,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      'Drink Water',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ], // children
                                ),
                              ], // children
                            ),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '459',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ), // TextStyle
                                  ), // Text
                                  SizedBox(width: 3),
                                  Text(
                                    'Ml',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ), // TextStyle
                                  ), // Text
                                ]
                            ),
                            SizedBox(height: 8),
                            Text(
                              '5% more than the average people',
                              style: TextStyle(
                                fontSize: 7,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ), // TextStyle
                            ), // Text
                          ], // children
                        ),
                      ),
                      SizedBox(width: 24),
                      Container(
                        height: 142,
                        width: 142,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            width: 8,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/api-new.png',
                                  width: 40,
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: 1),
                                Text(
                                  'Read',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ], // children
                            ),
                            SizedBox(height: 8),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '40',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ), // TextStyle
                                  ), // Text
                                  SizedBox(width: 3),
                                  Text(
                                    'mins',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]
                            ),
                            SizedBox(height: 8),
                            Text(
                              '5% more than the average people',
                              style: TextStyle(
                                fontSize: 7,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ], // children
                        ),
                      ),
                    ], // children
                  ),
                  SizedBox(height: 20),
                ], // children
              ),
            ], // children
          ),
        ),
      ),
    );
  }
}



