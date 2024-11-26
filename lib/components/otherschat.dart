import 'package:flutter/material.dart';

class OthersChat extends StatefulWidget {
  OthersChat({super.key, required this.chat, required this.users});

  final chat;
  final users;

  @override
  State<OthersChat> createState() => _OthersChatState();
}

class _OthersChatState extends State<OthersChat> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
            "assets/images/users/${getUsername(widget.chat["senderid"])}.png"),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getUsername(widget.chat["senderid"]),
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 130,
                minHeight: 0,
              ),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0XFFD9D9D9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
                child: Text(
                  widget.chat["message"],
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF464646),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 32),
      ],
    );
  }

  String getUsername(id) {
    String us = "";
    for (int i = 0; i < widget.users!.length; i++) {
      if (widget.users![i]["userid"] == id) {
        us = widget.users![i]["username"];
        return us;
      }
    }

    return "Christian";
  }
}
