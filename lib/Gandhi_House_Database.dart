import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';



double ag=0;
double bg=0;
double cg=0;
double dg =0;
double eg=0;
double fg=0;
double gg=0;
double hg=0;
double ig =0;
double jg=0;
double kg=0;

//6 captains 5 vice captains
final String tablename = 'gandhi';
final String gcolumncan1 = 'can1';
final String gcolumncan2 = 'can2';
final String gcolumncan3 = 'can3';
final String gcolumncan4 = 'can4';
final String gcolumncan5 = 'can5';
final String gcolumncan6 = 'can6';
final String gcolumncan7 = 'can7';
final String gcolumncan8 = 'can8';
final String gcolumncan9 = 'can9';
final String gcolumncan10 = 'can10';
final String gcolumncan11 = 'can11';

class votesg {
  int can1;
  int can2;
  int can3;
  int can4;
  int can5;
  int can6;
  int can7;
  int can8;
  int can9;
  int can10;
  int can11;
  votesg();
  // convenience constructor to create a Word object
  votesg.fromMap(Map<String, dynamic> map) {
    can1 = map[gcolumncan1];
    can2 = map[gcolumncan2];
    can3 = map[gcolumncan3];
    can4 = map[gcolumncan4];
    can5 = map[gcolumncan5];
    can6 = map[gcolumncan6];
    can7 = map[gcolumncan7];
    can8 = map[gcolumncan8];
    can9 = map[gcolumncan9];
    can10 = map[gcolumncan10];
    can11 = map[gcolumncan11];
  }
  Map<String, dynamic> toMap1() {
    var map1 = <String, dynamic>{
      gcolumncan1: can1,
      gcolumncan2: can2,
      gcolumncan3: can3,
      gcolumncan4: can4,
      gcolumncan5: can5

    };
    return map1;
  }

  Map<String, dynamic> toMap2() {
    var map2 = <String, dynamic>{
      gcolumncan6: can6,
      gcolumncan7: can7,
      gcolumncan8: can8,
      gcolumncan9: can9,
      gcolumncan10: can10,
      gcolumncan11: can11
    };
    return map2;
  }
}




class gandhihouse{
  static final _databaseName = "Gandhi_house.db";
  static final _databaseVersion = 1;

  gandhihouse._privateConstructor();
  static final gandhihouse instance = gandhihouse._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,_databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db,int version) async{
    await db.execute('''
    CREATE TABLE $tablename(
    $gcolumncan1 INTEGER,
    $gcolumncan2 INTEGER,
    $gcolumncan3 INTEGER,
    $gcolumncan4 INTEGER,
    $gcolumncan5 INTEGER,
    $gcolumncan6 INTEGER,
    $gcolumncan7 INTEGER,
    $gcolumncan8 INTEGER,
    $gcolumncan9 INTEGER,
    $gcolumncan10 INTEGER,
    $gcolumncan11 INTEGER)''');
  }

  Future<int> insertvc(votesg votes) async {
    Database db = await database;
    int entry = await db.insert(tablename, votes.toMap1());
    return entry;
  }

  Future<int> insertc(votesg votes) async {
    Database db = await database;
    int entry = await db.insert(tablename, votes.toMap2());
    return entry;
  }


  Future<votesg> countvotesvc() async {

    Database db = await database;
    int countc1 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan1) FROM $tablename WHERE $gcolumncan1=1'));
    int countc2 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan2) FROM $tablename WHERE $gcolumncan2=1'));
    int countc3 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan3) FROM $tablename WHERE $gcolumncan3=1'));
    int countc4 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan4) FROM $tablename WHERE $gcolumncan4=1'));
    int countc5 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan5) FROM $tablename WHERE $gcolumncan5=1'));

     ag = countc1.toDouble();
     bg = countc2.toDouble();
     cg = countc3.toDouble();
     dg = countc4.toDouble();
     eg = countc5.toDouble();


  }


  Future<votesg> countvotesc() async {
    Database db = await database;

    int countc6 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan6) FROM $tablename WHERE $gcolumncan6=1'));
    int countc7 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan7) FROM $tablename WHERE $gcolumncan7=1'));
    int countc8 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan8) FROM $tablename WHERE $gcolumncan8=1'));
    int countc9 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan9) FROM $tablename WHERE $gcolumncan9=1'));
    int countc10 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan10) FROM $tablename WHERE $gcolumncan10=1'));
    int countc11 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($gcolumncan11) FROM $tablename WHERE $gcolumncan11=1'));

    fg = countc6.toDouble();
    gg = countc7.toDouble();
    hg = countc8.toDouble();
    ig = countc9.toDouble();
    jg = countc10.toDouble();
    kg = countc11.toDouble();





  }

  Future clearg() async {

    Database db = await database;
    await db.delete(tablename);



  }

}

