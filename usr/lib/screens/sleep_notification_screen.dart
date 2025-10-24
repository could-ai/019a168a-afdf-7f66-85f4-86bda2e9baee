import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/notification_service.dart';

class SleepNotificationScreen extends StatefulWidget {
  const SleepNotificationScreen({super.key});

  @override
  State<SleepNotificationScreen> createState() => _SleepNotificationScreenState();
}

class _SleepNotificationScreenState extends State<SleepNotificationScreen> {
  bool _notificationScheduled = false;

  void _scheduleNotification() {
    NotificationService().scheduleDailySleepNotification();
    setState(() {
      _notificationScheduled = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sleep notification scheduled for 11:00 PM daily!'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Get a reminder every night to help you maintain a healthy sleep schedule.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.schedule),
              label: const Text('Set Daily 11 PM Reminder'),
              onPressed: _notificationScheduled ? null : _scheduleNotification,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            if (_notificationScheduled)
              const Text(
                'Reminder is set!',
                style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
