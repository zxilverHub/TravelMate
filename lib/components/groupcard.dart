import 'package:flutter/material.dart';

class GroupCard extends StatefulWidget {
  const GroupCard({super.key});

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/community/comicon.png"),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0XFF4DC3FF),
                    ),
                    child: Text("Aklan", style: labelStyle()),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0XFF5DED2D),
                    ),
                    child: Text("80 online", style: labelStyle()),
                  ),
                ],
              ),
              Text(
                "Boracay community",
                style: nameStyle(),
              ),
              Text("Cassy: Hello mga oat", style: textStyle()),
            ],
          )
        ],
      ),
    );
  }

  TextStyle titleStyle() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle nameStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color.fromARGB(255, 46, 45, 45),
    );
  }

  TextStyle labelStyle() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }
}
