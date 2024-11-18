import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class StudentItem extends StatelessWidget {
  final int index;

  StudentItem(this.index);

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<AttendanceProvider>(context).students[index];

    return ListTile(
      title: Text(student.name),
      trailing: Checkbox(
        value: student.isPresent,
        onChanged: (_) {
          Provider.of<AttendanceProvider>(context, listen: false)
              .toggleAttendance(index);
        },
      ),
    );
  }
}
