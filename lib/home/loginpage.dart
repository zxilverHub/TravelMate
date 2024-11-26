import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_mate/data/users.dart';
import 'package:travel_mate/home/home_screen.dart';
import 'package:travel_mate/home/signuppage.dart';
import 'package:travel_mate/models/userinfo.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool isShowPass = false;

  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  User? userLog;
  List users = usersList;

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
                image: AssetImage("assets/images/home/sign/signbg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(46, 22, 46, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF4DC3FF),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: emailCtrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text(
                          "Email Address",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF464646),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    TextField(
                      controller: passCtrl,
                      obscureText: !isShowPass,
                      decoration: InputDecoration(
                        suffixIcon: TextButton(
                          onPressed: () {
                            setState(() {
                              isShowPass = !isShowPass;
                            });
                          },
                          child: Icon(
                            isShowPass
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF464646),
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          bottom: 10,
                          left: 16,
                          right: 8,
                          top: 0,
                        ), // Adjust vertical padding
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 6,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 117, 116, 116),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (validateAccount()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => HomeScreen(user: userLog!),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 80,
                        ),
                        backgroundColor: Color(0XFF4DC3FF),
                        foregroundColor: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have account?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 90, 87, 87),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(left: 0),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 35, 71, 192),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "or connect with",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 139, 134, 134),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              // elevation: 0,
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/home/sign/fb.png"),
                                const SizedBox(width: 8),
                                Text(
                                  "Facebook",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 90, 87, 87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              // elevation: 0,
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/home/sign/gg.png"),
                                const SizedBox(width: 8),
                                Text(
                                  "Google",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 90, 87, 87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool validateAccount() {
    String email = emailCtrl.text;
    String pass = passCtrl.text;

    for (int i = 0; i < users.length; i++) {
      User u = users[i];
      if (u.userAccount.emailAddress == email &&
          u.userAccount.password == pass) {
        userLog = u;

        return true;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Incorrect email or password"),
      ),
    );
    return false;
  }
}
