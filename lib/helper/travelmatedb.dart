import 'package:path/path.dart';
import 'package:travel_mate/helper/userdb.dart';
import 'package:sqflite/sqflite.dart';

class Travelmatedb {
  static const String dbName = "travelmate.db";
  static const int version = 7;

  static Future<Database> openDb() async {
    var path = join(await getDatabasesPath(), dbName);

    var db = await openDatabase(
      path,
      version: version,
      onCreate: (db, version) => _onCreate(db, version),
      onUpgrade: (db, oldVersion, newVersion) =>
          _onUpgrade(db, oldVersion, newVersion),
    );

    return db;
  }

  static Future _onCreate(Database db, version) async {
    /*
    altered to users
     - added profileURL
    */

    var sql = '''
        CREATE TABLE IF NOT EXISTS ${Userdb.user} (
        ${Userdb.userid} integer primary key,
        ${Userdb.username} text,
        ${Userdb.email} text,
        ${Userdb.password} text
        );''';

    db.execute(sql);

    print("DB IS OPENED");
  }

  static Future _onUpgrade(Database db, oldVersion, newVersion) async {}

  static Future<int> addNewUser(Map<String, dynamic> user) async {
    var db = await openDb();

    var userResult = await db.rawQuery(
        "SELECT COUNT(email) as users FROM USER WHERE email = ?",
        [user[Userdb.email]]);

    int userCount = userResult.first["users"] as int;
    if (userCount > 0) {
      return 0;
    }

    var id = await db.insert(Userdb.user, user);
    print("Added new user");
    return id;
  }

  static Future<int> userLogIn(Map<String, dynamic> user) async {
    var db = await openDb();
    var userResult = await db.rawQuery(
        "SELECT COUNT(email) as users, userId FROM USER WHERE email = ? and password = ?",
        [user[Userdb.email], user[Userdb.password]]);

    int userCount = userResult.first["users"] as int;
    if (userCount <= 0) {
      return 0;
    }

    return userResult.first["userId"] as int;
  }

  static Future<Map<String, dynamic>> getUserInfo(uid) async {
    var db = await openDb();
    var user = await db.query(
      Userdb.user,
      where: "${Userdb.userid} = ?",
      whereArgs: [uid],
    );

    return user.first;
  }
}
