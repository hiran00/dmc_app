import 'package:flutter/material.dart';
import 'package:disaster_management/components/custom_bottom_navbar.dart';

class EmergencyAlertsPage extends StatelessWidget {
  const EmergencyAlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Emergency Alerts'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            _WeatherAlertItem(
              dayTime: 'Sun, 12:40pm',
              message: 'Showers or thundershowers will occur',
            ),
            _WeatherAlertItem(
              dayTime: 'Mon, 11:50pm',
              message: 'Misty conditions can be expected at',
            ),
            _WeatherAlertItem(
              dayTime: 'Tue, 10:56pm',
              message: 'Heavy showers more than 100mm',
            ),
            _WeatherAlertItem(
              dayTime: 'Sun, 12:40pm',
              message: 'Showers or thundershowers will occur',
            ),
            _WeatherAlertItem(
              dayTime: 'Mon, 11:50pm',
              message: 'Misty conditions can be expected at',
            ),
            _WeatherAlertItem(
              dayTime: 'Tue, 10:56pm',
              message: 'Heavy showers more than 100mm',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 1,
        onItemTapped: (index) {
          if (index == 1) return; // Already on Alerts page

          String route = '';
          switch (index) {
            case 0:
              route = '/home';
              break;
            case 2:
              route = '/newsfeed';
              break;
            case 3:
              route = '/profile';
              break;
          }

          if (route.isNotEmpty) {
            Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
          }
        },
      ),
    );
  }
}

class _WeatherAlertItem extends StatelessWidget {
  final String dayTime;
  final String message;

  const _WeatherAlertItem({
    required this.dayTime,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: const Icon(
                Icons.notifications_active,
                color: Colors.red,
                size: 35,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weather Warning :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        dayTime,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
