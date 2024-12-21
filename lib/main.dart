import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_mate/community/cornerscreen.dart';
import 'package:travel_mate/community/groupchat.dart';
import 'package:travel_mate/helper/travelmatedb.dart';
import 'package:travel_mate/home/getstarted.dart';
import 'package:travel_mate/home/home_screen.dart';
// import 'package:travel_mate/home/getstarted.dart';
import 'package:travel_mate/home/loginpage.dart';
import 'package:travel_mate/home/signuppage.dart';
import 'package:travel_mate/models/userinfo.dart';

Position? initialPosition;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(TravelMate());
}

class TravelMate extends StatefulWidget {
  TravelMate({super.key});

  @override
  State<TravelMate> createState() => _TravelMateState();
}

class _TravelMateState extends State<TravelMate> {
  @override
  Widget build(BuildContext context) {
    Travelmatedb.openDb();

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
              userid: 1,
            ),
        '/corner': (context) => CornerScreen(
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
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
          ),
        );
        return child!;
      },
    );
  }
}
