import 'package:flutter/material.dart';
import 'package:travel_mate/models/userschats.dart';

class PrivateCard extends StatefulWidget {
  PrivateCard({super.key, required this.user});

  Userschats user;

  @override
  State<PrivateCard> createState() => _PrivateCardState();
}

class _PrivateCardState extends State<PrivateCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset("assets/images/users/${widget.user.username}.png"),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.user.username, style: nameStyle()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.user.chats.last, style: textStyle()),
                    SizedBox(width: 12),
                    Text(widget.user.time, style: textStyle()),
                  ],
                ),
              ],
            )
          ],
        ),
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
