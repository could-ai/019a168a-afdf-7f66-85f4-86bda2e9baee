import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/notification_service.dart';

class MedicineNotificationScreen extends StatefulWidget {
  const MedicineNotificationScreen({super.key});

  @override
  State<MedicineNotificationScreen> createState() => _MedicineNotificationScreenState();
}

class _MedicineNotificationScreenState extends State<MedicineNotificationScreen> {
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
      _scheduleMedicineNotification(picked);
    }
  }

  void _scheduleMedicineNotification(TimeOfDay time) {
    NotificationService().scheduleMedicineNotification(
      id: 1,
      title: 'Medicine Reminder',
      body: 'Time to take your medicine. Just 5 minutes left!',
      scheduledTime: time,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Reminder set for 5 minutes before ${_selectedTime!.format(context)}'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Set a time for your medicine reminder.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            if (_selectedTime != null)
              Text(
                'Reminder set for: ${_selectedTime!.format(context)}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.alarm_add),
              onPressed: () => _selectTime(context),
              label: Text(_selectedTime == null ? 'Set Medicine Time' : 'Change Time'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
