import 'package:disaster_management/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/onboarding/splash_screen.dart';
import 'screens/home/home.dart';
import 'screens/home/alerts.dart';
import 'screens/home/newsfeed.dart';
import 'screens/home/profile.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 255, 255, 255),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Optionally use this if splash is your entry
      home: const SplashScreen(),

      routes: {
        '/home': (context) => const HomeScreen(),
        '/emergencyAlerts': (context) => const EmergencyAlertsPage(),
        '/newsfeed': (context) => const NewsfeedPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
