import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dashboard.dart';
import 'habit.dart';
import 'profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => HabitPage()));
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
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: 80),
             Container(
               width: 300,
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     'Your Profile!',
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.black,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   Icon(
                     Icons.settings,
                     size: 16,
                   ),
                 ],
               ),
             ),
             SizedBox(height: 10),
             Container(
               height: 160,
               width: 320,
               decoration: BoxDecoration(
                 color: Color(0xFFE5D3FF),
                 border: Border.all(
                   color: Color(0xFF6100ED),
                   width: 2,
                 ),
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(16),
                   topRight: Radius.circular(16),
                 ),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.all(16),
                     child:  ClipRRect(
                       borderRadius: BorderRadius.circular(12),
                       child: Image.asset(
                         'assets/labib.jpg',
                         width: 80,
                         height: 80,
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'Profile',
                         style: TextStyle(
                           fontSize: 20,
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Text(
                         'Labib',
                         style: TextStyle(
                           fontSize: 12,
                           color: Colors.black,
                           fontWeight: FontWeight.normal,
                         ),
                       ),
                     ],
                   )
                 ],
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   height: 60,
                   width: 160,
                   decoration: BoxDecoration(
                     color: Color(0xFFE5D3FF),
                     border: Border(
                       bottom: BorderSide(color: Color(0xFF6100ED), width: 2),
                       left: BorderSide(color: Color(0xFF6100ED), width: 2),
                       right:  BorderSide(color: Color(0xFF6100ED), width: 2),
                     ),
                     borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(16),
                     ),
                   ),
                   child: Padding(
                     padding: EdgeInsets.only(top: 4.0, left: 12, right: 12, bottom: 2),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Total Streak',
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(height: 3),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               '20',
                               style: TextStyle(
                                 fontSize: 16,
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             Image.asset(
                               'assets/Group 3.png',
                               width: 23,
                               height: 23,
                               fit: BoxFit.fill,
                             ),
                           ],
                         ),
                       ],
                     ),
                   )
                 ),
                 Container(
                   height: 60,
                   width: 160,
                   decoration: BoxDecoration(
                     color: Color(0xFFE5D3FF),
                     border: Border(
                       bottom: BorderSide(color: Color(0xFF6100ED), width: 2),
                       right: BorderSide(color: Color(0xFF6100ED), width: 2),
                     ),
                     borderRadius: BorderRadius.only(
                       bottomRight: Radius.circular(16),
                     ),
                   ),
                   child: Padding(
                     padding: EdgeInsets.only(top: 4.0, left: 12, right: 12, bottom: 2),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Task Completed',
                           style: TextStyle(
                             fontSize: 12,
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(height: 3),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               '25',
                               style: TextStyle(
                                 fontSize: 16,
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             Image.asset(
                               'assets/task.png',
                               width: 23,
                               height: 23,
                               fit: BoxFit.fill,
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
             SizedBox(height: 20),
             Container(
               height: 60,
               width: 320,
               decoration: BoxDecoration(
                 color: Color(0xFFE5D3FF),
                 border: Border(
                   top: BorderSide(color: Color(0xFF6100ED), width: 2),
                   bottom: BorderSide(color: Color(0xFF6100ED), width: 2),
                   right: BorderSide(color: Color(0xFF6100ED), width: 2),
                   left: BorderSide(color: Color(0xFF6100ED), width: 2),
                 ),
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(16),
                   topRight: Radius.circular(16),
                 ),
               ),
               child:  Padding(
                 padding: EdgeInsets.only(top: 12, left: 12, right: 2, bottom: 2),
                 child: Text(
                   'Day Tracking',
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ),
             Container(
               height: 140,
               width: 320,
               decoration: BoxDecoration(
                 color: Color(0xFFE5D3FF),
                 border: Border(
                   bottom: BorderSide(color: Color(0xFF6100ED), width: 2),
                   right: BorderSide(color: Color(0xFF6100ED), width: 2),
                   left: BorderSide(color: Color(0xFF6100ED), width: 2),
                 ),
                 borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(16),
                   bottomRight: Radius.circular(16),
                 ),
               ),
               child: Padding(
                 padding: EdgeInsets.all(12),
                 child: TableCalendar(
                   focusedDay: DateTime.now(),
                   firstDay: DateTime.now().subtract(Duration(days: DateTime.now().weekday % 7)),
                   lastDay: DateTime.now().add(Duration(days: 6 - DateTime.now().weekday % 7)),
                   calendarFormat: CalendarFormat.week,
                   availableCalendarFormats: const {
                     CalendarFormat.week: 'Week',
                   },
                   headerVisible: false, // hides the month switcher
                   daysOfWeekVisible: true,
                   onDaySelected: (selectedDay, focusedDay) {
                     // do something with the selected date
                   },
                 ),
               ),
             ),
             SizedBox(height: 20),
             Container(
               height: 60,
               width: 320,
               decoration: BoxDecoration(
                 color: Color(0xFFE5D3FF),
                 border: Border(
                   top: BorderSide(color: Color(0xFF6100ED), width: 2),
                   bottom: BorderSide(color: Color(0xFF6100ED), width: 2),
                   right: BorderSide(color: Color(0xFF6100ED), width: 2),
                   left: BorderSide(color: Color(0xFF6100ED), width: 2),
                 ),
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(16),
                   topRight: Radius.circular(16),
                 ),
               ),
               child: Padding(
                 padding: EdgeInsets.only(top: 12, left: 12, right: 2, bottom: 2),
                 child: Text(
                   'Daily Quote',
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ),
             Container(
               height: 140,
               width: 320,
               decoration: BoxDecoration(
                 color: Color(0xFFE5D3FF),
                 border: Border(
                   bottom: BorderSide(color: Color(0xFF6100ED), width: 2),
                   right: BorderSide(color: Color(0xFF6100ED), width: 2),
                   left: BorderSide(color: Color(0xFF6100ED), width: 2),
                 ),
                 borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(16),
                   bottomRight: Radius.circular(16),
                 ),
               ),
               child: Container(
                 child: Center(
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.purple.shade100,
                       borderRadius: BorderRadius.all(Radius.circular(12)),
                     ),
                     child: Padding(
                       padding: EdgeInsets.all(24.0),
                       child: Text(
                         'Ubur-ubur ikan lele\n workout dong lee',
                         style: TextStyle(
                           fontSize: 16,
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                   ),
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