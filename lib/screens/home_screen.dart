import 'package:demo_app/screens/about_screen.dart';
import 'package:demo_app/screens/feedback_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Demo App',
              style: TextStyle(
                fontSize: 32.0,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('About'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutScreen()));
              }
            ),
            ElevatedButton(
                child: const Text('Feedback'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeedbackScreen()));
                }
            ),
          ],
        ),
      ),
    );
  }
}
