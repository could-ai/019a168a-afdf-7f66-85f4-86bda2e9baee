import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/radiation_alert_screen.dart';
import 'package:couldai_user_app/screens/screen_time_screen.dart';
import 'package:couldai_user_app/screens/sleep_notification_screen.dart';
import 'package:couldai_user_app/screens/medicine_notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindful Notifications'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(12.0), // Reduced padding
        childAspectRatio: 1.1, // Adjust aspect ratio
        children: <Widget>[
          _buildFeatureCard(
            context,
            'Radiation Alerts',
            Icons.warning,
            Colors.red,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RadiationAlertScreen()),
            ),
          ),
          _buildFeatureCard(
            context,
            'Screen Time',
            Icons.phone_android,
            Colors.blue,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenTimeScreen()),
            ),
          ),
          _buildFeatureCard(
            context,
            'Sleep Notification',
            Icons.nightlight_round,
            Colors.purple,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SleepNotificationScreen()),
            ),
          ),
          _buildFeatureCard(
            context,
            'Medicine Alerts',
            Icons.medical_services,
            Colors.green,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MedicineNotificationScreen()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.95, end: 1.0),
      duration: const Duration(milliseconds: 500),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Card(
        margin: const EdgeInsets.all(6.0), // Reduced margin
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 45.0, color: color), // Slightly smaller icon
              const SizedBox(height: 12.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500), // Adjusted text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
