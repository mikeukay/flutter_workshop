import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/cat.png'),
                radius: 64.0,
              ),
            ),
            Divider(height: 64.0),
            Label(
              labelText: 'identity',
              valueText: 'Mike Ukay',
            ),
            Label(
              labelText: 'company',
              valueText: 'FireAcademy LLC',
            ),
            Label(
              labelText: 'role',
              valueText: 'Founder, CEO',
            ),
            Label(
              labelText: 'twitter',
              valueText: '@mikeukay',
              launchUrlWhenTapped: 'https://www.twitter.com/mikeukay',
            ),
            Label(
              labelText: 'company url',
              valueText: 'fireacademy.io',
              launchUrlWhenTapped: 'https://www.fireacademy.io',
            ),
          ],
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String labelText;
  final String valueText;
  final String launchUrlWhenTapped;

  const Label({Key key,
    @required this.labelText,
    @required this.valueText,
    this.launchUrlWhenTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText.toUpperCase(),
          style: TextStyle(
            color: Colors.red,
            letterSpacing: 1.5,
            fontSize: 12.0,
          ),
        ),
        const SizedBox(height: 4.0),
        GestureDetector(
          child: Text(
            valueText,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: launchUrlWhenTapped == null ? null : () {
            launch(launchUrlWhenTapped);
          },
        ),
        const SizedBox(height: 28.0),
      ],
    );
  }
}

