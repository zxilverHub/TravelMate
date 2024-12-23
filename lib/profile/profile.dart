import 'package:flutter/material.dart';
import 'package:travel_mate/helper/travelmatedb.dart';
import 'package:travel_mate/helper/userdb.dart';

class Profile extends StatefulWidget {
  Profile({super.key, required this.userid});

  int userid;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileBackground(),
        Positioned(
          top: 70,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 22,
            ),
            child: Column(
              children: [
                ProfileHeader(),
                const SizedBox(height: 12),
                ProfileMain(),
                ProfileButtons()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column ProfileButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),
        Text(
          "General",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Card(
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Color(0XFF4DC3FF),
                ),
                const SizedBox(width: 12),
                Text(
                  "Profile settings",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.archive,
                  color: Color(0XFF4DC3FF),
                ),
                const SizedBox(width: 12),
                Text(
                  "Archive",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.sunny,
                  color: Color(0XFF4DC3FF),
                ),
                const SizedBox(width: 12),
                Text(
                  "Theme",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            confirmLogout();
          },
          child: Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Color(0XFF4DC3FF),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container ProfileMain() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: FutureBuilder(
          future: Travelmatedb.getUserInfo(widget.userid),
          builder: (_, s) {
            if (s.connectionState == ConnectionState.waiting) {
              return MainProfileSkeleton();
            }
            var prof = s.data;
            return Column(
              children: [
                ClipOval(
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset(
                      prof![Userdb.profileURL] ??
                          "assets/images/app/noprofile.png",
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/app/noprofile.png",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  prof[Userdb.username],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  prof[Userdb.email],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 90, 88, 88),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Column MainProfileSkeleton() {
    return Column(
      children: [
        ClipOval(
          child: CircleAvatar(
            radius: 50,
            child: Image.asset(
              "assets/images/app/noprofile.png",
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/images/app/noprofile.png",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Username",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "email",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 90, 88, 88),
          ),
        ),
      ],
    );
  }

  Row ProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Container ProfileBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/profile/profilebg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void confirmLogout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          "Log out",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF4DC3FF),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 32,
                )),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              "Log out",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
