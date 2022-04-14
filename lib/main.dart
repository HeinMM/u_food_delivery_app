import 'package:flutter/material.dart';
import 'package:u_food_delivery_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurpleAccent,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
