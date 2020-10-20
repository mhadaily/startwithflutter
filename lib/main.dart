import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/setting.dart';

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
