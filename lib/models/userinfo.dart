import 'package:travel_mate/models/corner.dart';

class User {
  late int userid;
  late String username;
  late UserAcount userAccount;

  List<Corner> corners = [];

  User({
    required this.userid,
    required this.username,
    required this.userAccount,
  });

  void addCorner(Corner c) {
    corners.add(c);
  }
}

class UserAcount {
  late String emailAddress;
  late String password;

  UserAcount({
    required this.emailAddress,
    required this.password,
  });
}
