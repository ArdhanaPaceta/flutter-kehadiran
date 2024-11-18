import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<AttendanceProvider>(context).history;

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (ctx, i) {
          final record = history[i];
          return ListTile(
            title: Text(
              '${record['date'].toString().split(' ')[0]}',
            ),
            subtitle: Text(
              'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
            ),
          );
        },
      ),
    );
  }
}
