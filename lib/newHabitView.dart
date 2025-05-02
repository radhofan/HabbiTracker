import 'package:flutter/material.dart';
import 'package:habbitracker/habitCalender.dart';
import 'newHabit.dart';
import 'habitCalender.dart';

class NewHabitViewPage extends StatefulWidget {
  const NewHabitViewPage({super.key});

  @override
  State<NewHabitViewPage> createState() => _NewHabitViewPageState();
}
class _NewHabitViewPageState extends State<NewHabitViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 36),
              Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewhabitPage()),
                  );
                },
                child: Container(
                  height: 80,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xFFEADBFF),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 16),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFFC3A1FF),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Create Custom Habit',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HabitCalenderPage()),
                  );
                },
                child: Container(
                  height: 80,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xFFEADBFF),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 16),
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFFC3A1FF),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/workout.png',
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Workout',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '0/1',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 136),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFFC3A1FF),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 16,
                          color: Colors.white,
                        ),
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
}