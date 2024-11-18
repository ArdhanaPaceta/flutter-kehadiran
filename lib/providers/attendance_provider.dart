import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendanceProvider with ChangeNotifier {
  List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
  ];

  List<Student> get students => _students;

  List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get history => _history;

  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    final presentCount = _students.where((s) => s.isPresent).length;
    final absentCount = _students.length - presentCount;

    _history.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    _students.forEach((student) {
      student.isPresent = false;
    });

    notifyListeners();
  }
}
