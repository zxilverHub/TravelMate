import 'package:flutter/material.dart';
import 'package:travel_mate/community/groupchat.dart';
import 'package:travel_mate/components/cornercard.dart';
import 'package:travel_mate/components/groupcard.dart';
import 'package:travel_mate/components/privateCard.dart';
import 'package:travel_mate/models/userinfo.dart';
import 'package:travel_mate/models/userschats.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({super.key, required this.user});

  User user;

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List privateChats = chatsList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 70,
          left: 21,
          right: 21,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Comunity", style: titleStyle()),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => GroupChat(user: widget.user)),
                  );
                },
                child: GroupCard(),
              ),
              const SizedBox(height: 16),
              CornerCard(),
              const SizedBox(height: 32),
              Text("Private chats", style: titleStyle()),
              Container(
                height: 510,
                child: ListView.builder(
                  itemCount: privateChats.length,
                  itemBuilder: (_, i) {
                    final uc = privateChats[i];
                    return GestureDetector(
                      onTap: () {},
                      child: PrivateCard(user: uc),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  TextStyle titleStyle() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }
}
