import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_mate/components/destinationcard.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  List<Map<String, dynamic>>? destinations = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDestinations();
  }

  Future<void> getDestinations() async {
    String jsonString =
        await rootBundle.loadString("assets/data/destinations.json");

    Map<String, dynamic> jsonData =
        json.decode(jsonString) as Map<String, dynamic>;

    setState(() {
      destinations = (jsonData['destinations'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .toList();
      destinations = destinations!.reversed.toList();

      destinations!.sort((a, b) => a["id"].compareTo(b["id"]));

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 21,
          right: 21,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Destinations", style: titleStyle()),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: const Color.fromARGB(57, 70, 68, 68),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.collections_bookmark,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: destinations!.length,
                        itemBuilder: (_, i) {
                          final des = destinations![i];
                          return DestinationCard(destination: des);
                        },
                      ),
              ),
            ],
          ),
        ),
      ],
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
