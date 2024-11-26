import 'package:flutter/material.dart';
import 'package:travel_mate/components/servicecard.dart';
import 'package:travel_mate/models/servicelist.dart';
import 'package:travel_mate/models/userinfo.dart';

class HomeContent extends StatefulWidget {
  HomeContent({super.key, required this.user});

  User user;
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List servicesList = services;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home/themeimages/homebg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 21,
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 8, 32, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Image.asset("assets/images/user/profile.png"),
                SizedBox(width: 8),
                Text(
                  widget.user.username,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
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
        ),
        Positioned(
          left: 21,
          top: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Unravel the",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Beauty of",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset("assets/images/home/themeimages/texttheme.png"),
                ],
              )
            ],
          ),
        ),
        Positioned(
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
            ))
      ],
    );
  }
}
