import 'package:flutter/material.dart';
import 'package:travel_mate/data/services.dart';
import 'package:travel_mate/destination/servicescreen.dart';
// import 'package:travel_mate/models/servicelist.dart';

class ServiceCard extends StatefulWidget {
  ServiceCard({super.key, required this.service});

  Services service;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ServiceScreen(service: widget.service),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 21),
        child: Container(
          width: 270,
          height: 380,
          padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    child: Image.asset(
                      "assets/images/home/services/${widget.service.name}.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "${widget.service.name}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                              "assets/images/home/services/location.png"),
                          SizedBox(width: 6),
                          Text(
                            "${widget.service.distance}m",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF464646),
                            ),
                          ),
                        ],
                      ),
                      // Wrap the Stack in a Container to ensure it has space
                      Container(
                        width: 50, // Provide a width for the Stack
                        height:
                            30, // Provide height to allow images to be placed
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 0,
                              right: 60,
                              child: Image.asset(
                                "assets/images/user/profile.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 45,
                              child: Image.asset(
                                "assets/images/user/profile5.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 30,
                              child: Image.asset(
                                "assets/images/user/profile3.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 15,
                              child: Image.asset(
                                "assets/images/user/profile4.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color:
                                      const Color.fromARGB(255, 245, 243, 243),
                                ),
                                child: Center(
                                  child: Text("+${widget.service.online}"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white24,
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_outline_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
