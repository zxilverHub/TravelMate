class User {
  late int userid;
  late String username;
  late UserAcount userAccount;

  User({
    required this.userid,
    required this.username,
    required this.userAccount,
  });
}

class UserAcount {
  late String emailAddress;
  late String password;

  UserAcount({
    required this.emailAddress,
    required this.password,
  });
}
