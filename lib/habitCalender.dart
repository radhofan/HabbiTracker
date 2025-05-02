import 'package:flutter/material.dart';
import 'newHabit.dart';
import 'package:table_calendar/table_calendar.dart';
import 'habit.dart';

class HabitCalenderPage extends StatefulWidget {
  const HabitCalenderPage({super.key});

  @override
  State<HabitCalenderPage> createState() => _HabitCalenderPageState();
}

class _HabitCalenderPageState extends State<HabitCalenderPage> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 500,
              decoration: const BoxDecoration(
                color: Color(0xFFC3A1FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  topRight: Radius.circular(75),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 36),
                  Container(
                    width: 300,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.close),
                          iconSize: 24,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HabitPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 64),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFC3A1FF),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/workout.png',
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            children: [
                              Text(
                                'Workout',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '1 times - weekly',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 32),
                          SizedBox(
                            width: 64,
                            height: 64,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 50, // Set size for the progress bar
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    value: progress,
                                    strokeWidth: 6,
                                    backgroundColor: Colors.grey.shade300,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                  ),
                                ),
                                Text(
                                  '${(progress * 1).toInt()}/1',
                                  style: const TextStyle(
                                    fontSize: 16, // make text larger
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 36),
                      Row(
                        children: [
                          SizedBox(width: 64),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFC3A1FF),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/api-new.png',
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            children: [
                              Text(
                                '0 days',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'current streak',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(64, 18, 64, 96),
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Color(0xFFEADBFF), // 👈 light purple background
                        borderRadius: BorderRadius.circular(16), // optional rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16), // 👈 adjust padding as needed
                        child: TableCalendar(
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: DateTime.now(),
                          calendarStyle: CalendarStyle(
                            todayDecoration: BoxDecoration(
                              color: Colors.purple.shade200,
                              shape: BoxShape.circle,
                            ),
                            todayTextStyle: const TextStyle(color: Colors.white),
                          ),
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: TextStyle(
                              color: Colors.purple,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.purple),
                            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 42),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}