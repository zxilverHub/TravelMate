import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_mate/home/getstarted.dart';
// import 'package:travel_mate/home/getstarted.dart';
import 'package:travel_mate/home/loginpage.dart';
import 'package:travel_mate/home/signuppage.dart';

void main() {
  runApp(TravelMate());
}

class TravelMate extends StatelessWidget {
  TravelMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color(0XFFF2F1EC),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => GetStarted(),
        '/login': (context) => Loginpage(),
        '/signup': (context) => SignUpPage(),
      },
      builder: (context, child) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent, // Transparent status bar
          ),
        );
        return child!;
      },
    );
  }
}
