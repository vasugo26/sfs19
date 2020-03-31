import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';



double an=0;
double bn=0;
double cn=0;
double dn =0;
double en=0;
double fn=0;
double gn=0;
double hn=0;



//3 captains 4vice captains
final String tablename = 'nehru';
final String ncolumncan1 = 'can1';
final String ncolumncan2 = 'can2';
final String ncolumncan3 = 'can3';
final String ncolumncan4 = 'can4';
final String ncolumncan5 = 'can5';
final String ncolumncan6 = 'can6';
final String ncolumncan7 = 'can7';


class nvotes {
  int can1;
  int can2;
  int can3;
  int can4;
  int can5;
  int can6;
  int can7;

  nvotes();
  // convenience constructor to create a Word object
  nvotes.fromMap(Map<String, dynamic> map) {
    can1 = map[ncolumncan1];
    can2 = map[ncolumncan2];
    can3 = map[ncolumncan3];
    can4 = map[ncolumncan4];
    can5 = map[ncolumncan5];
    can6 = map[ncolumncan6];
    can7 = map[ncolumncan7];

  }
  Map<String, dynamic> toMap1() {
    var map1 = <String, dynamic>{
      ncolumncan1: can1,
      ncolumncan2: can2,
      ncolumncan3: can3,
      ncolumncan4: can4,


    };
    return map1;
  }

  Map<String, dynamic> toMap2() {
    var map2 = <String, dynamic>{

      ncolumncan5: can5,
      ncolumncan6: can6,
      ncolumncan7: can7,

    };
    return map2;
  }
}




class nehruhouse{
  static final _databaseName = "Nehru_house.db";
  static final _databaseVersion = 1;

  nehruhouse._privateConstructor();
  static final nehruhouse instance = nehruhouse._privateConstructor();

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
    $ncolumncan1 INTEGER,
    $ncolumncan2 INTEGER,
    $ncolumncan3 INTEGER,
    $ncolumncan4 INTEGER,
    $ncolumncan5 INTEGER,
    $ncolumncan6 INTEGER,
    $ncolumncan7 INTEGER)''');
  }

  Future<int> insertvc(nvotes votes) async {
    Database db = await database;
    int entry = await db.insert(tablename, votes.toMap1());
    return entry;
  }

  Future<int> insertc(nvotes votes) async {
    Database db = await database;
    int entry = await db.insert(tablename, votes.toMap2());
    return entry;
  }


  Future<nvotes> countvotesvc() async {
    Database db = await database;
    int countc1 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($ncolumncan1) FROM $tablename WHERE $ncolumncan1=1'));
    int countc2 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($ncolumncan2) FROM $tablename WHERE $ncolumncan2=1'));
    int countc3 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($ncolumncan3) FROM $tablename WHERE $ncolumncan3=1'));
    int countc4 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($ncolumncan4) FROM $tablename WHERE $ncolumncan4=1'));


    an = countc1.toDouble();
    bn = countc2.toDouble();
    cn = countc3.toDouble();
    dn = countc4.toDouble();


  }


  Future<nvotes> countvotesc() async {
    Database db = await database;

    int countc5 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($ncolumncan5) FROM $tablename WHERE $ncolumncan5=1'));
    int countc6 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($ncolumncan6) FROM $tablename WHERE $ncolumncan6=1'));
    int countc7 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($ncolumncan7) FROM $tablename WHERE $ncolumncan7=1'));

    en = countc5.toDouble();
    fn = countc6.toDouble();
    gn= countc7.toDouble();

  }

  Future clearn() async {

    Database db = await database;
    await db.delete(tablename);



  }
}
