import 'package:flutter/material.dart';

class MyChat extends StatefulWidget {
  MyChat(
      {super.key, required this.chat, required this.users, required this.user});

  final chat;
  final users;
  final user;

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 130,
                minHeight: 0,
              ),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0XFF4DC3FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                    bottomLeft: Radius.circular(22),
                  ),
                ),
                child: Text(
                  widget.chat["message"],
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Image.asset("assets/images/user/profile.png"),
      ],
    );
  }
}
