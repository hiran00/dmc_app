import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFF5F5F5),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 40),
            Column(
              children: const [
                Icon(Icons.image, size: 100, color: Colors.grey),
                SizedBox(height: 10),
                Text('App Logo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            const SizedBox(height: 40),
            _buildDrawerItem(Icons.notifications, 'Alerts', context, '/emergencyAlerts'),
            _buildDrawerItem(Icons.feed, 'News Feed', context, '/newsfeed'),
            _buildDrawerItem(Icons.contacts, 'Contacts', context, '/contacts'),
            _buildDrawerItem(Icons.school, 'Knowledge Panel', context, '/knowledgePanel'),
            _buildDrawerItem(Icons.policy, 'Privacy Policy', context, '/privacy_policy'),
            _buildDrawerItem(Icons.settings, 'Profile Settings', context, '/profile'),
            _buildDrawerItem(Icons.logout, 'Logout', context, '/login'),
          ],
        ),
      ),
    );
  }

  static Widget _buildDrawerItem(
    IconData icon,
    String title,
    BuildContext context,
    String routeName,
  ) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, routeName);
          },
        ),
        const Divider(),
      ],
    );
  }
}
