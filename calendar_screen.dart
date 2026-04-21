import 'package:flutter/material.dart';
import 'task_screen.dart';

class CalendarScreen extends StatelessWidget {
  final Color primaryBlue = Color(0xFF1565C0);

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: Text("Calendário")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Hoje",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                title: Text(
                    "${today.day}/${today.month}/${today.year}"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TaskScreen(date: today),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}