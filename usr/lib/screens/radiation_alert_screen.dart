import 'package:flutter/material.dart';

class RadiationAlertScreen extends StatefulWidget {
  const RadiationAlertScreen({super.key});

  @override
  State<RadiationAlertScreen> createState() => _RadiationAlertScreenState();
}

class _RadiationAlertScreenState extends State<RadiationAlertScreen> {
  void _showRadiationAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('High Radiation Detected'),
          content: const Text('There is more radiation, keep your phone away.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radiation Alerts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Simulate a high radiation event.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showRadiationAlert,
              child: const Text('Simulate High Radiation'),
            ),
          ],
        ),
      ),
    );
  }
}
