import 'package:flutter/material.dart';
import 'package:travel_mate/home/getstarted_1.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/home/gs/gsbg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF4DC3FF),
                    padding: EdgeInsets.fromLTRB(48, 20, 48, 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => GetStarted1()),
                    );
                  },
                  child: Text(
                    "Get started with TravelMate",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: bottomText()),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text("Sin in", style: bottomText(isbtn: true)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle bottomText({isbtn = false}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: !isbtn ? Color(0XFF797E81) : Color(0Xff2C6CF5),
      decoration: !isbtn ? TextDecoration.none : TextDecoration.underline,
    );
  }
}
