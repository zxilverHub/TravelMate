import 'package:flutter/material.dart';

class GetStarted3 extends StatelessWidget {
  const GetStarted3({super.key});

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
                image: AssetImage("assets/images/home/gs/gs3bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 36,
                right: 36,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      indec(),
                      const SizedBox(width: 6),
                      indec(),
                      const SizedBox(width: 6),
                      indec(isAct: true),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Get started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF4DC3FF),
                      padding: EdgeInsets.fromLTRB(48, 16, 48, 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget indec({isAct = false}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isAct ? Color(0XFF4DC3FF) : Color(0XFF797E81),
        borderRadius: BorderRadius.circular(10), // Circular border radius
      ),
    );
  }
}
