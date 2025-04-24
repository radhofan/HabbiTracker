import 'package:flutter/material.dart';

class HabitDetailState with ChangeNotifier {

  String _habitName = '';
  String get habitName => _habitName;
  void updateHabitName(String newHabitName){
    _habitName = newHabitName;
    notifyListeners();
}

  Color _currentColor = Colors.grey;
  Color get currentColor => _currentColor;
  void updateColor(Color newColor) {
    _currentColor = newColor;
    notifyListeners();
  }

  String _selectedImage = 'assets/workout.png';
  String get selectedImage => _selectedImage;
  void updateSelectedImage(String newImagePath) {
    _selectedImage = newImagePath;
    notifyListeners();
  }

  int _selectedContainer = -1;
  int get selectedContainer => _selectedContainer;
  void updateSelectedContainer(int newSelectedContainer){
    _selectedContainer = newSelectedContainer;
    notifyListeners();
  }

  String _selectedFrequency = 'Daily';
  String get selectedFrequency => _selectedFrequency;
  void updateFrequency(String newSelectedFrequency) {
    _selectedFrequency = newSelectedFrequency;
    notifyListeners();
  }


  bool monday = true;
  bool tuesday = true;
  bool wednesday = true;
  bool thursday = true;
  bool friday = true;
  bool saturday = true;
  bool sunday = true;
  List<String> getSelectedDays() {
    List<String> selectedDays = [];
    if (monday) selectedDays.add('Monday');
    if (tuesday) selectedDays.add('Tuesday');
    if (wednesday) selectedDays.add('Wednesday');
    if (thursday) selectedDays.add('Thursday');
    if (friday) selectedDays.add('Friday');
    if (saturday) selectedDays.add('Saturday');
    if (sunday) selectedDays.add('Sunday');
    return selectedDays;
  }
  void updateDay(String day, bool value) {
    switch (day.toLowerCase()) {
      case 'monday':
        monday = value;
        break;
      case 'tuesday':
        tuesday = value;
        break;
      case 'wednesday':
        wednesday = value;
        break;
      case 'thursday':
        thursday = value;
        break;
      case 'friday':
        friday = value;
        break;
      case 'saturday':
        saturday = value;
        break;
      case 'sunday':
        sunday = value;
        break;
    }
    notifyListeners();
  }

  int _weeklyGoal = 0;
  int get weeklyGoal => _weeklyGoal;
  void updateWeeklyGoal(int newWeeklyGoal){
    _weeklyGoal = newWeeklyGoal;
    notifyListeners();
  }

  void reset() {
    _habitName = '';
    _currentColor = Colors.grey;
    _selectedImage = 'assets/workout.png';
    _selectedContainer = -1;
    _selectedFrequency = 'Daily';
    monday = true;
    tuesday = true;
    wednesday = true;
    thursday = true;
    friday = true;
    saturday = true;
    sunday = true;
    notifyListeners();
  }

}
