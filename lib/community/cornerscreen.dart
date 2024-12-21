import 'package:flutter/material.dart';
import 'package:travel_mate/models/corner.dart';
import 'package:travel_mate/models/userinfo.dart';

class CornerScreen extends StatefulWidget {
  CornerScreen({super.key, required this.user});

  User user;

  @override
  State<CornerScreen> createState() => _CornerScreenState();
}

class _CornerScreenState extends State<CornerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    addNewCorder();
  }

  void addNewCorder() {
    setState(() {
      widget.user.addCorner(
          Corner(id: 1, caption: "hello", timeAdded: DateTime.now()));
      widget.user.addCorner(
          Corner(id: 1, caption: "Lost and found", timeAdded: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 21,
            right: 18,
            top: 10,
          ),
          child: AppBar(
            backgroundColor: Color(0XFFF2F1EC),
            title: Text("Community Corner", style: titleStyle()),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Image.asset("assets/images/icons/back.png"),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/icons/add.png"),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("My corner", style: titleStyle()),
                    const SizedBox(height: 12),
                    widget.user.corners.length > 0
                        ? Column(
                            children: widget.user.corners
                                .map(
                                  (c) => Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 12,
                                    ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            color: Colors.white),
                                        child: ExpansionTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            foregroundColor: Colors.white,
                                            child:
                                                Text(widget.user.username[0]),
                                          ),
                                          title: Text(widget.user.username,
                                              style: nameStyle()),
                                          subtitle: Text(c.timeAdded.toString(),
                                              style: textStyle()),
                                          children: [
                                            Container(
                                                padding: EdgeInsets.only(
                                                  top: 0,
                                                  bottom: 12,
                                                  right: 18,
                                                  left: 18,
                                                ),
                                                width: double.infinity,
                                                child: Text(c.caption,
                                                    style: textStyle())),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
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
}
