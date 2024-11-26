class Userschats {
  late String username;
  late String time;
  late List<String> chats;

  Userschats({
    required this.username,
    required this.time,
    required this.chats,
  });
}

List chatsList = [
  Userschats(
    username: "Christian",
    time: "02:17pm",
    chats: ["abcdefghijk", "abcdefg"],
  ),
  Userschats(
    username: "Dave",
    time: "10:30am",
    chats: ["abcdefghijk", "abasscdefg"],
  ),
  Userschats(
    username: "Cassandra",
    time: "10:45am",
    chats: ["abcdefghijk", "absadasecdefg"],
  ),
  Userschats(
    username: "Nichole",
    time: "11:50am",
    chats: ["abcdefghijk", "gdfeabcdefg"],
  ),
  Userschats(
    username: "Kimberly",
    time: "12:01pm",
    chats: ["abcdefghijk", "habsacdefg"],
  ),
];
