import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_mate/components/appbar.dart';
import 'package:travel_mate/components/mychat.dart';
import 'package:travel_mate/components/otherschat.dart';
import 'package:travel_mate/models/userinfo.dart';

class GroupChat extends StatefulWidget {
  GroupChat({super.key, required this.user});

  User user;

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final FocusNode _focusNode = FocusNode();

  List<Map<String, dynamic>>? chats;
  List<Map<String, dynamic>>? users;
  Map<String, dynamic>? gcinfo;

  var msgCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getChats();
  }

  Future<void> getChats() async {
    String jsonString = await rootBundle.loadString("assets/data/gcchats.json");

    Map<String, dynamic> jsonData =
        json.decode(jsonString) as Map<String, dynamic>;

    setState(() {
      chats = (jsonData['messages'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .reversed
          .toList();
      users = (jsonData['users'] as List<dynamic>).cast<Map<String, dynamic>>();
      gcinfo = jsonData['groupinfo'] as Map<String, dynamic>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 21,
            right: 21,
            bottom: 21,
            child: Column(
              children: [
                CustomAppBar(),
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: chats!.length,
                      itemBuilder: (_, i) {
                        final chat = chats![i];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 42,
                            child: widget.user.userid != chat["senderid"]
                                ? OthersChat(
                                    chat: chat,
                                    users: users,
                                  )
                                : MyChat(
                                    chat: chat,
                                    users: users,
                                    user: widget.user,
                                  ),
                          ),
                        );
                      }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 42,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.image),
                      ),
                      Expanded(
                        child: TextField(
                          focusNode: _focusNode,
                          controller: msgCtrl,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (msgCtrl.text != "") {
                            sendMessage();
                          }
                        },
                        child: Text("SEND", style: sendStyle()),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
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

  TextStyle sendStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0XFF4DC3FF),
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

  void sendMessage() {
    int msgId = chats!.first["messageid"] + 1;
    Map<String, dynamic> newMsg = {
      "messageid": msgId,
      "senderid": widget.user.userid,
      "message": msgCtrl.text
    };

    setState(() {
      msgCtrl.text = '';
      chats!.insert(0, newMsg);
    });
  }
}
