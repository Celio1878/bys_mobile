import 'package:flutter/material.dart';

class JoinUsSection extends StatelessWidget {
  final bool isUserLoggedIn; // Pass true or false based on session state

  const JoinUsSection({super.key, this.isUserLoggedIn = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade600, Colors.blue.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Junte-se à Nossa Comunidade',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Torne-se parte de uma comunidade em constante crescimento de leitores e escritores.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          if (!isUserLoggedIn)
            ElevatedButton(
              onPressed: () {
                // Handle Google Sign-In
              },
              child: Text('Login with Google'),
            ),
        ],
      ),
    );
  }
}
