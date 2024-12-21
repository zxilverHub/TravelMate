import 'package:flutter/material.dart';

class DestinationCard extends StatefulWidget {
  DestinationCard({super.key, required this.destination});

  Map<String, dynamic> destination;

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
      ),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/destination/${widget.destination["id"]}.png",
                ),
              ),
            ),
          ),
          title: Text("${widget.destination["name"]}", style: nameStyle()),
          subtitle: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.green,
                size: 18,
              ),
              widget.destination["distance"] < 10
                  ? Text("You are here", style: textStyle())
                  : Text("${widget.destination["distance"]}m",
                      style: textStyle()),
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
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
