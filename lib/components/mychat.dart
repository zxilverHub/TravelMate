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
    return GestureDetector(
      onLongPress: () => showMsgOptions(),
      child: Row(
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
                    "${widget.chat["message"]}",
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
        ],
      ),
    );
  }

  showMsgOptions() {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 21,
          right: 21,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.maximize_rounded),
            Card(
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
