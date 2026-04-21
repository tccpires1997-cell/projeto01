import 'package:flutter/material.dart';
import 'calendar_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final Color primaryBlue = Color(0xFF1565C0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryBlue, Color(0xFF42A5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10)
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Login",
                    style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold)),

                SizedBox(height: 20),

                TextField(
                  controller: userController,
                  decoration: InputDecoration(labelText: "Usuário"),
                ),

                SizedBox(height: 10),

                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Senha"),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CalendarScreen()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    child: Text("Entrar"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}