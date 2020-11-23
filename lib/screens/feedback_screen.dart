import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        centerTitle: true,
      ),
      body: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  String feedback = "";
  String message = "";
  bool isSending = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      child: Column(
        children: [
          TextFormField(
            maxLength: 1024,
            minLines: 3,
            maxLines: 10,
            enabled: !isSending,
            decoration: InputDecoration(
              labelText: 'Feedback',
              hintText: 'I love your app',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).disabledColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[500]),
              ),
            ),
            onChanged: (newVal) => feedback = newVal,
          ),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: isSending ? null : () async {
              setState(() {
                isSending = true;
                message = "Sending feedback...";
              });
              String url = "https://us-central1-fireacademy-landing.cloudfunctions.net/sendFeedback";
              http.Response r = await http.post(
                  url,
                  headers: {'Content-Type': 'application/json'},
                  body: jsonEncode({'data': {'feedback': feedback}})
              );
              setState(() {
                isSending = false;
                message = "Your feedback has been submitted";
              });
            },
          ),
          const SizedBox(height: 8.0),
          Center(
            child: Text(message)
          ),
        ],
      ),
    );
  }
}

