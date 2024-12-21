import 'dart:io';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:travel_mate/helper/locationhelper.dart';
import 'package:travel_mate/home/getstarted_1.dart';
import 'package:travel_mate/home/home_screen.dart';

class GetStarted extends StatefulWidget {
  GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  Location location = new Location();

  bool? isServiceEnabled;
  PermissionStatus? permissionGranted;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserLocation();
  }

  void getUserLocation() async {
    isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled!) {
      isServiceEnabled = await location.requestService();

      if (!isServiceEnabled!) {
        exit(0);
      }
    }

    permissionGranted = await location.requestPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();

      if (permissionGranted == PermissionStatus.denied) {
        exit(0);
      }
    }

    LocationData ld = await location.getLocation();
    setState(() {
      userLocation = ld;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userLocation == null ? LoadingLocation() : MainGetStarted(context),
    );
  }

  Center LoadingLocation() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          const SizedBox(height: 12),
          Text("(Getting location) Please wait..."),
        ],
      ),
    );
  }

  Stack MainGetStarted(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home/gs/gsbg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF4DC3FF),
                  padding: EdgeInsets.fromLTRB(48, 20, 48, 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    // to delete
                    // MaterialPageRoute(builder: (_) => GetStarted1()),
                    MaterialPageRoute(builder: (_) => HomeScreen(userid: 2)),
                  );
                },
                child: Text(
                  "Get started with TravelMate",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: bottomText()),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text("Sin in", style: bottomText(isbtn: true)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  TextStyle bottomText({isbtn = false}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: !isbtn ? Color(0XFF797E81) : Color(0Xff2C6CF5),
      decoration: !isbtn ? TextDecoration.none : TextDecoration.underline,
    );
  }
}
