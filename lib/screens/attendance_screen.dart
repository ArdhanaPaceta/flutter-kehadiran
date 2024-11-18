import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';
import '../widgets/student_item.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: attendanceProvider.students.length,
              itemBuilder: (ctx, i) => StudentItem(i),
            ),
          ),
          ElevatedButton(
            onPressed: attendanceProvider.students.isEmpty
                ? null
                : () => attendanceProvider.saveAttendance(),
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }
}
