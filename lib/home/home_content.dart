import 'package:flutter/material.dart';
import 'package:travel_mate/components/servicecard.dart';
import 'package:travel_mate/helper/locationhelper.dart';
import 'package:travel_mate/helper/travelmatedb.dart';
import 'package:travel_mate/helper/userdb.dart';
import 'package:travel_mate/models/servicelist.dart';
import 'package:geocoding/geocoding.dart';

class HomeContent extends StatefulWidget {
  HomeContent({super.key, required this.userid});

  int userid = 1;
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List servicesList = services;

  Map<String, dynamic>? user;

  Placemark? userPlacemarks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadUserInfo();
    getPlaceMarks();
  }

  Future<Placemark> getPlaceMarks() async {
    double lati = userLocation!.latitude as double;
    double longi = userLocation!.longitude as double;
    List<Placemark> place = await placemarkFromCoordinates(lati, longi);
    return place.first;
  }

  void loadUserInfo() async {
    var info = await Travelmatedb.getUserInfo(widget.userid);
    setState(() {
      user = info;
    });
  }

  Future<Map<String, dynamic>> getUserData() async {
    var info = await Travelmatedb.getUserInfo(widget.userid);
    return info;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeBackground(),
        HomeUserProfile(),
        SosBtn(),
        HomeWelcome(),
        HomeServices()
      ],
    );
  }

  Positioned HomeServices() {
    return Positioned(
      top: 300,
      left: 0,
      right: 0,
      child: Container(
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 21, left: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Near you",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See more",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 70, 69, 68),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: 300,
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: servicesList.length,
                itemBuilder: (_, i) {
                  final ser = servicesList[i];
                  return ServiceCard(
                    service: ser,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned HomeWelcome() {
    return Positioned(
      left: 21,
      top: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: getPlaceMarks(),
            builder: (_, s) {
              if (s.connectionState == ConnectionState.waiting) {
                return const Text(
                  "Loading",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }

              if (s.connectionState == ConnectionState.done) {
                if (s.hasData) {
                  var up = s.data;
                  var com =
                      "${up!.street}, ${up.locality}, ${up.subAdministrativeArea}";
                  return Container(
                    width: MediaQuery.of(context).size.width - 42,
                    child: Text(
                      com,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }
              }

              return const Text(
                "Unkwon location name",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Positioned SosBtn() {
    return Positioned(
      top: 60,
      right: 21,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Color(0XFFC50002),
          foregroundColor: Colors.white,
        ),
        onPressed: () {},
        icon: Icon(Icons.sos),
      ),
    );
  }

  Positioned HomeUserProfile() {
    return Positioned(
      top: 60,
      left: 21,
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 8, 32, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: FutureBuilder(
          future: getUserData(),
          builder: (_, s) {
            if (s.connectionState == ConnectionState.waiting) {
              return Row(
                children: [
                  ClipOval(
                    child: CircleAvatar(
                      child: Image.asset(
                        "assets/images/app/noprpfile.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/images/app/noprofile.png");
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Loading",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            }

            return Row(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    s.data![Userdb.profileURL] ??
                        "assets/images/app/noprpfile.png",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/images/app/noprofile.png");
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  s.data![Userdb.username],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Container HomeBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home/themeimages/homebg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
