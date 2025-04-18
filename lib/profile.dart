import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dashboard.dart';
import 'welcome.dart';
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
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: 80),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
             Container(
               height: 160,
               width: 320,
               decoration: BoxDecoration(
                 color: Colors.purple.shade200,
                 border: Border.all(
                   color: Colors.purple,
                   width: 4,
                 ),
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(16),
                   topRight: Radius.circular(16),
                 ),
               ),
               child: Row(
                 children: [
                   Image.asset(
                     'assets/api-new.png',
                     width: 40,
                     height: 30,
                     fit: BoxFit.fill,
                   ),
                   Column(
                     children: [
                       Text(
                         'Labib',
                         style: TextStyle(
                           fontSize: 16,
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Text(
                         'Name',
                         style: TextStyle(
                           fontSize: 16,
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
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
                     color: Colors.purple.shade200,
                     border: Border(
                       bottom: BorderSide(color: Colors.purple, width: 4),
                       left: BorderSide(color: Colors.purple, width: 4),
                       right:  BorderSide(color: Colors.purple, width: 4),
                     ),
                     borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(16),
                     ),
                   ),
                   child: Column(
                     children: [
                       Text(
                         'Total Streak',
                         style: TextStyle(
                           fontSize: 16,
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Row(
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
                             'assets/api-new.png',
                             width: 40,
                             height: 30,
                             fit: BoxFit.fill,
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                 Container(
                   height: 60,
                   width: 160,
                   decoration: BoxDecoration(
                     color: Colors.purple.shade200,
                     border: Border(
                       bottom: BorderSide(color: Colors.purple, width: 4),
                       right: BorderSide(color: Colors.purple, width: 4),
                     ),
                     borderRadius: BorderRadius.only(
                       bottomRight: Radius.circular(16),
                     ),
                   ),
                   child: Column(
                     children: [
                       Text(
                         'Task Completed',
                         style: TextStyle(
                           fontSize: 16,
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Row(
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
                             'assets/api-new.png',
                             width: 40,
                             height: 30,
                             fit: BoxFit.fill,
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             ),
             SizedBox(height: 20),
             Container(
               height: 60,
               width: 320,
               decoration: BoxDecoration(
                 color: Colors.purple.shade200,
                 border: Border(
                   top: BorderSide(color: Colors.purple, width: 4),
                   bottom: BorderSide(color: Colors.purple, width: 4),
                   right: BorderSide(color: Colors.purple, width: 4),
                   left: BorderSide(color: Colors.purple, width: 4),
                 ),
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(16),
                   topRight: Radius.circular(16),
                 ),
               ),
               child: Text(
                 'Day Tracking',
                 style: TextStyle(
                   fontSize: 16,
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             Container(
               height: 140,
               width: 320,
               decoration: BoxDecoration(
                 color: Colors.purple.shade200,
                 border: Border(
                   bottom: BorderSide(color: Colors.purple, width: 4),
                   right: BorderSide(color: Colors.purple, width: 4),
                   left: BorderSide(color: Colors.purple, width: 4),
                 ),
                 borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(16),
                   bottomRight: Radius.circular(16),
                 ),
               ),
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
             SizedBox(height: 20),
             Container(
               height: 60,
               width: 320,
               decoration: BoxDecoration(
                 color: Colors.purple.shade200,
                 border: Border(
                   top: BorderSide(color: Colors.purple, width: 4),
                   bottom: BorderSide(color: Colors.purple, width: 4),
                   right: BorderSide(color: Colors.purple, width: 4),
                   left: BorderSide(color: Colors.purple, width: 4),
                 ),
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(16),
                   topRight: Radius.circular(16),
                 ),
               ),
               child: Text(
                 'Daily Quote',
                 style: TextStyle(
                   fontSize: 16,
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             Container(
               height: 140,
               width: 320,
               decoration: BoxDecoration(
                 color: Colors.purple.shade200,
                 border: Border(
                   bottom: BorderSide(color: Colors.purple, width: 4),
                   right: BorderSide(color: Colors.purple, width: 4),
                   left: BorderSide(color: Colors.purple, width: 4),
                 ),
                 borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(16),
                   bottomRight: Radius.circular(16),
                 ),
               ),
               child: Container(
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
           ],
         ),
        ),
      ),
    );
  }
}