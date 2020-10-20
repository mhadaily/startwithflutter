import 'package:flutter/material.dart';
import 'screens/homepage_screen.dart';
import 'screens/setting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/setting': (context) => SettingScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
