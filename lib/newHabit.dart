import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'newHabitMain.dart';

class NewhabitPage extends StatefulWidget {
  const NewhabitPage({super.key});

  @override
  State<NewhabitPage> createState() => _NewhabitPageState();
}

class _NewhabitPageState extends State<NewhabitPage> {



  Color currentColor = Colors.blue;

  void changeColor(Color color) {
    setState(() {
      currentColor = color;
    });
  }

  int currentStep = 2;

  int selectedContainer = -1;

  String selectedFrequency = 'Daily';

  bool monday = true;
  bool tuesday = true;
  bool wednesday = true;
  bool thursday = true;
  bool friday = true;
  bool saturday = true;
  bool sunday = true;

  String selectedImage = 'assets/workout.png';
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

  void _showImagePicker() async {
    final String? newImage = await showDialog<String>(
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
    );

    if (newImage != null) {
      setState(() {
        selectedImage = newImage;
      });
    }
  }
  void showColorPickerDialog() {
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

  Widget getStepContent(){
    if (currentStep == 2) {
      return Column(
        children: [
          SizedBox(height: 36),
          Text(
            'What is the name of your habit?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: 180,
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter habit name',
             ),
            ),
          ),
        ],
      );
    } else if (currentStep == 4) {
      return Column(
        children: [
          SizedBox(height: 36),
          Text(
            'Select an icon and color that best represents',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: _showImagePicker, // Open the color picker on tap
            child: Container(
              width: 200,
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
          SizedBox(height: 16),
          GestureDetector(
            onTap: showColorPickerDialog, // Open the color picker on tap
            child: Container(
              width: 200,
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
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: currentColor,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Select Color',
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
      );
    } else if (currentStep == 6) {
      return Column(
        children: [
          SizedBox(height: 36),
          Text(
            'How often do you want to complete this habit?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFrequency = 'Daily';
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: selectedFrequency == 'Daily'
                        ? Colors.purple.shade200
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Daily',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedFrequency == 'Daily'
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
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: selectedFrequency == 'Weekly'
                        ? Colors.purple.shade200
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Weekly',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedFrequency == 'Weekly'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
          SizedBox(height: 24),
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
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                        color:  monday ? Colors.purple[200] : Colors.purple[800],
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
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tuesday = !tuesday;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                        color:  tuesday ? Colors.purple[200] : Colors.purple[800],
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
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                        color:  wednesday ? Colors.purple[200] : Colors.purple[800],
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
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                        color:  thursday ? Colors.purple[200] : Colors.purple[800],
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
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                        color:  friday ? Colors.purple[200] : Colors.purple[800],
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
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                        color:  saturday ? Colors.purple[200] : Colors.purple[800],
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
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                        color:  sunday? Colors.purple[200] : Colors.purple[800],
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
            )
        ],
      );
    } else if (currentStep == 8) {
      return Column(
        children: [
          SizedBox(height: 36),
          Text(
            'What is your weekly goal?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: 180,
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '1 times',
              ),
            ),
          ),
        ],
      );
    } else if (currentStep == 10) {
      return Column(
        children: [
          SizedBox(height: 36),
          Text(
            'Does this habit relate to any\n specific time of day?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Container(
            width: 240,
            height: 240,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContainer = 0; // Set selected container to 0
                    });
                  },
                  child: Container(
                    width: 240,
                    height: 80,
                    decoration: BoxDecoration(
                      color: selectedContainer == 0
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
                SizedBox(height: 6),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = 1; // Set selected container to 0
                        });
                      },
                      child: Container(
                        width: 76,
                        height: 80,
                        decoration: BoxDecoration(
                          color: selectedContainer == 1
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
                          selectedContainer = 2; // Set selected container to 0
                        });
                      },
                      child: Container(
                        width: 76,
                        height: 80,
                        decoration: BoxDecoration(
                          color: selectedContainer == 2
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
                          selectedContainer = 3; // Set selected container to 0
                        });
                      },
                      child: Container(
                        width: 76,
                        height: 80,
                        decoration: BoxDecoration(
                          color: selectedContainer == 3
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
        ],
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewhabitMainPage()),
        );
      });
      return Container();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(36),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              currentStep += 2;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFC3A1FF),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Continue',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 56),
            Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.navigate_before),
                    iconSize: 24,
                    onPressed: () {
                      setState(() {
                        currentStep -= 2;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 24,
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 180,
              child: LinearProgressIndicator(
                value: currentStep * 0.1,
                semanticsLabel: 'Achieved',
                minHeight: 8,
              ),
            ),
            getStepContent(),
          ],
        ),
      ),
    );
  }
}
