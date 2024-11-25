import 'package:flutter/material.dart';
import 'package:travel_mate/community/dommunity.dart';
import 'package:travel_mate/destination/destination.dart';
import 'package:travel_mate/home/home_content.dart';
import 'package:travel_mate/models/userinfo.dart';
import 'package:travel_mate/notification/notification.dart';
import 'package:travel_mate/profile/profile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.user});

  User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentPage = "home";
  int _currentIndex = 0;

  Widget pageScreen() {
    Widget? screen;

    if (currentPage == "home") {
      screen = HomeContent(
        user: widget.user,
      );
    } else if (currentPage == "profile") {
      screen = Profile(
        user: widget.user,
      );
    } else if (currentPage == "community") {
      screen = CommunityPage();
    } else if (currentPage == "destination") {
      screen = DestinationPage();
    } else if (currentPage == "notification") {
      screen = NotificationPage();
    } else {
      screen = HomeContent(
        user: widget.user,
      );
    }

    return screen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageScreen(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;

              if (_currentIndex == 0) {
                currentPage = "home";
              }

              switch (_currentIndex) {
                case 0:
                  {
                    currentPage = "home";
                    break;
                  }
                case 1:
                  {
                    currentPage = "destination";
                    break;
                  }

                case 2:
                  {
                    currentPage = "community";
                    break;
                  }

                case 3:
                  {
                    currentPage = "notification";
                    break;
                  }

                case 4:
                  {
                    currentPage = "profile";
                    break;
                  }
              }
            });
          },
          selectedItemColor:
              const Color.fromARGB(255, 24, 114, 189), // Active tab color
          unselectedItemColor: Colors.black, // Inactive tab color
          showSelectedLabels: false, // Hide text label of active item
          showUnselectedLabels: false, // Hide text label of inactive item
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/home/nav-icons/home.png"),
              activeIcon:
                  Image.asset("assets/images/home/nav-icons/home-active.png"),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/home/nav-icons/destination.png"),
              activeIcon: Image.asset(
                  "assets/images/home/nav-icons/destination-active.png"),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/home/nav-icons/community.png"),
              activeIcon: Image.asset(
                  "assets/images/home/nav-icons/community-active.png"),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon:
                  Image.asset("assets/images/home/nav-icons/notification.png"),
              activeIcon: Image.asset(
                  "assets/images/home/nav-icons/notification-active.png"),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/home/nav-icons/profile.png"),
              activeIcon: Image.asset(
                  "assets/images/home/nav-icons/profile-active.png"),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
