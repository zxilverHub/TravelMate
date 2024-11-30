import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_mate/community/groupchat.dart';
import 'package:travel_mate/home/getstarted.dart';
import 'package:travel_mate/home/home_screen.dart';
// import 'package:travel_mate/home/getstarted.dart';
import 'package:travel_mate/home/loginpage.dart';
import 'package:travel_mate/home/signuppage.dart';
import 'package:travel_mate/models/userinfo.dart';

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
      initialRoute: '/home',
      routes: {
        '/': (context) => GetStarted(),
        '/login': (context) => Loginpage(),
        '/signup': (context) => SignUpPage(),
        '/gc': (context) => GroupChat(
              user: User(
                userid: 2,
                username: "Migz",
                userAccount: UserAcount(
                  emailAddress: "user@gmail.com",
                  password: "123",
                ),
              ),
            ),
        '/home': (context) => HomeScreen(
              user: User(
                userid: 2,
                username: "Migz",
                userAccount: UserAcount(
                  emailAddress: "user@gmail.com",
                  password: "123",
                ),
              ),
            ),
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
