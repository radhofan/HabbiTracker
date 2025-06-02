import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'habit.dart';
import 'package:provider/provider.dart';
import 'habitDetail.dart';
import 'package:flutter/services.dart';
import 'newHabitView.dart';
import 'service/api_service.dart';

class EditHabit extends StatefulWidget {
  final int habitId;  // add the parameter here

  const EditHabit({super.key, required this.habitId});  // required in constructor

  @override
  State<EditHabit> createState() => _EditHabit();
}

class _EditHabit extends State<EditHabit> {

  bool _isDeleting = false;
  String? _error;
  bool _isLoading = false;

  // Make sure you receive the habitId from the widget
  int get habitId => widget.habitId;

  Map<String, dynamic>? _habit;
  bool _isUpdating = false;

  String selectedFrequency = '';
  String selectedImage = '';
  TextEditingController? _habitNameController;
  int completed = 0;
  int inProgress = 0;
  int notStarted = 0;
  int time = 0;

  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;

  Color currentColor = Colors.blue;
  void changeColor(Color color) {
    setState(() {
      currentColor = color;
    });
  }

  int colorFromDb = 4281558371;
  Color? myColor;

  @override
  void initState() {
    super.initState();
    _habitNameController = TextEditingController();
    myColor = Color(colorFromDb);
    _getHabit();
  }


  Future<void> _getHabit() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final habit = await ApiService.getHabit(habitId);
      print(habit);

      setState(() {
        _habitNameController?.text = habit['name'] ?? '';
        selectedImage = '${habit['icon_default']}';
        selectedFrequency = habit['goal_time'];

        // Parse goal_status JSON string
        final goalStatus = jsonDecode(habit['goal_status']);
        completed = goalStatus['completed'];
        inProgress = goalStatus['in_progress'];
        notStarted = goalStatus['not_started'];

        // Parse time_options JSON array
        time = habit['time_options'];
        int color = habit['color'];
        myColor = Color(color);

        // Weekday logic (hardcoded for now)
        monday = true;
        tuesday = true;
        wednesday = true;
        thursday = true;
        friday = true;
        saturday = true;
        sunday = true;

        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _updateHabit(int habitId, Map<String, dynamic> updatedData) async {
    setState(() {
      _isUpdating = true;
      _error = null;
    });

    try {
      final updatedHabit = await ApiService.updateHabit(habitId, updatedData);
      print('Update successful: $updatedHabit');
      setState(() {
        _habit = updatedHabit; // update local habit data with response
        _isUpdating = false;
      });
      // optionally pop or show success message here
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isUpdating = false;
      });
    }
  }

  Future<void> _deleteHabit() async {
    setState(() {
      _isDeleting = true;
      _error = null;
    });

    try {
      print('Calling deleteHabit API...');
      final responseBody = await ApiService.deleteHabit(habitId);
      print('Delete successful: $responseBody');  // Print API response

      if (mounted) {
        Navigator.pop(context, true); // Indicate success on pop
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isDeleting = false;
      });
    }
  }
  void showColorPickerDialog(HabitDetailState habitDetailState) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick a Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: (color) {
                setState(() {
                  currentColor = color;
                  habitDetailState.updateColor(color);
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Select'),
            ),
          ],
        );
      },
    );
  }


  final List<String> imageList = [
    'assets/book.png',
    'assets/meditate.png',
    'assets/workout.png',
    'assets/water.png',
    'assets/burn.png',
    'assets/steps.png',
    'assets/bed.png',
    'assets/run.png',
  ];

  void _showImagePicker(HabitDetailState habitDetailState) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an Icon'),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 20.0,
              runSpacing: 10.0,
              children: imageList.map((image) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, image);
                  },
                  child: Image.asset(
                    image,
                    width: 40,
                    height: 40,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    ).then((newImage) {
      if (newImage != null) {
        setState(() {
          selectedImage = newImage;
          habitDetailState.updateSelectedImage(newImage);
        });
      }
    });
  }

  final TextEditingController weeklyGoalController = TextEditingController();

  void _showFrequencyOptions(HabitDetailState habitDetailState) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Choose Frequency'),
              content: Container(
                height: 640,
                width: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFrequency = 'Daily';
                              habitDetailState.updateFrequency('Daily');
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: habitDetailState.selectedFrequency == 'Daily'
                                  ? Colors.purple.shade200
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Daily',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: habitDetailState.selectedFrequency == 'Daily'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFrequency = 'Weekly';
                              habitDetailState.updateFrequency('Weekly');
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: habitDetailState.selectedFrequency == 'Weekly'
                                  ? Colors.purple.shade200
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Weekly',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: habitDetailState.selectedFrequency == 'Weekly'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    if (selectedFrequency == 'Daily')
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'On these days',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  monday = !monday;
                                  habitDetailState.updateDay('monday', monday);
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 240,
                                decoration: BoxDecoration(
                                  color: habitDetailState.getSelectedDays().contains('Monday') ? Colors.purple[200] : Colors.purple[800],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'Monday',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            // Similar GestureDetector for other days...
                            SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tuesday = !tuesday;
                                  habitDetailState.updateDay('tuesday', tuesday);
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 240,
                                decoration: BoxDecoration(
                                  color: habitDetailState.getSelectedDays().contains('Tuesday') ? Colors.purple[200] : Colors.purple[800],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'Tuesday',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  wednesday = !wednesday;
                                  habitDetailState.updateDay('wednesday', wednesday);
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 240,
                                decoration: BoxDecoration(
                                  color:  habitDetailState.getSelectedDays().contains('Wednesday') ? Colors.purple[200] : Colors.purple[800],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'Wednesday',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  thursday = !thursday;
                                  habitDetailState.updateDay('thursday', thursday);
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 240,
                                decoration: BoxDecoration(
                                  color:  habitDetailState.getSelectedDays().contains('Thursday') ? Colors.purple[200] : Colors.purple[800],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'Thursday',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  friday = !friday;
                                  habitDetailState.updateDay('friday', friday);
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 240,
                                decoration: BoxDecoration(
                                  color:  habitDetailState.getSelectedDays().contains('Friday') ? Colors.purple[200] : Colors.purple[800],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'Friday',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  saturday = !saturday;
                                  habitDetailState.updateDay('saturday', saturday);
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 240,
                                decoration: BoxDecoration(
                                  color:  habitDetailState.getSelectedDays().contains('Saturday') ? Colors.purple[200] : Colors.purple[800],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'Saturday',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  sunday = !sunday;
                                  habitDetailState.updateDay('sunday', sunday);
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 240,
                                decoration: BoxDecoration(
                                  color:  habitDetailState.getSelectedDays().contains('Sunday') ? Colors.purple[200] : Colors.purple[800],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'Sunday',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (selectedFrequency == 'Weekly')
                      Container(
                        width: 320,
                        child: Column(
                          children: [
                            Text(
                              'This habit will be tracked on a weekly basis and reset every Sunday',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 16),
                    Text(
                      'What is your weekly goal?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 180,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          final intValue = int.tryParse(value);
                          if (intValue != null) {
                            habitDetailState.updateWeeklyGoal(intValue);
                          }
                        },
                        controller: weeklyGoalController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number, // Shows number keyboard
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly, // Allows only digits (0-9)
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '3',
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // closes the dialog
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {

    final habitDetailState = Provider.of<HabitDetailState>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 56),
            Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Update Habit',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: _habitNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter habit name',
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Container(
              width: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Icon and Color',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => _showImagePicker(habitDetailState), // Open the color picker on tap
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100, // Set the background color to currentColor
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade600,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    selectedImage,
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Add icon',
                                style: TextStyle(
                                  color: Colors.purple.shade900, // White text color
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      GestureDetector(
                        onTap: () => showColorPickerDialog(habitDetailState),
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade600,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: myColor,
                                      borderRadius: BorderRadius.circular(36),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Color',
                                style: TextStyle(
                                  color: Colors.purple.shade900, // White text color
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Container(
                    width: 360,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Goal',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 120,
                          width: 360,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100, // Set the background color to currentColor
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 12),
                                      Text(
                                        '${habitDetailState.weeklyGoal} per week',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 120, // 👈 set your desired width
                                    child: ElevatedButton(
                                      onPressed: () => _showFrequencyOptions(habitDetailState),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purple[200],
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: const Text(
                                        'Change',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 40,
                                width: 320,
                                decoration: BoxDecoration(
                                  color:  Colors.purple[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 16), // 👈 just padding on the left
                                      child: Icon(Icons.refresh),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 16), // 👈 just padding on the left
                                      child: Text(
                                        habitDetailState.selectedFrequency,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: 320,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'During',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  time = 0;
                                });
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: time == 0
                                      ? Colors.purple.shade800
                                      : Colors.purple.shade200,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/allDay.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  time = 1;
                                });
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: time == 1
                                      ? Colors.purple.shade800
                                      : Colors.purple.shade200,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/morning.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  time = 2;
                                });
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: time == 2
                                      ? Colors.purple.shade800
                                      : Colors.purple.shade200,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/sunny.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  time = 3;
                                });
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: time == 3
                                      ? Colors.purple.shade800
                                      : Colors.purple.shade200,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/night.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Container(
                    width: 320,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reminder',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Set up  reminders to help you crush your new habit goals',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 60,
                          width: 320,
                          decoration: BoxDecoration(
                            color:  Colors.purple[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16), // 👈 just padding on the left
                                child: Text(
                                  'Set reminder',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 16), // 👈 just padding on the left
                                child: Icon(Icons.check_box_outlined),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            await _deleteHabit();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HabitPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent, // removes elevation shadow
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Delete habit',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150, // 👈 set your desired width
                        child: ElevatedButton(
                          onPressed: () async {
                            Map<String, dynamic> updatedData = {
                              'name': _habitNameController?.text,
                              'color': myColor,
                              'goal_time': selectedFrequency,
                              'icon_default': selectedImage,
                              'time_options': time,
                            };
                            await _updateHabit(habitId, updatedData);
                            habitDetailState.reset();         // then reset state
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NewHabitViewPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade100,
                            foregroundColor: Colors.purple.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Update Habit',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
