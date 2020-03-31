import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

double at=0;
double bt=0;
double ct=0;
double dt =0;
double et=0;
double ft=0;
double gt=0;
double ht=0;
double it =0;
double jt=0;



//4 captains 6vice captains
final String tablename = 'tagore';
final String tcolumncan1 = 'can1';
final String tcolumncan2 = 'can2';
final String tcolumncan3 = 'can3';
final String tcolumncan4 = 'can4';
final String tcolumncan5 = 'can5';
final String tcolumncan6 = 'can6';
final String tcolumncan7 = 'can7';
final String tcolumncan8 = 'can8';
final String tcolumncan9 = 'can9';
final String tcolumncan10 = 'can10';


class tvotes {
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

  tvotes();
  // convenience constructor to create a Word object
  tvotes.fromMap(Map<String, dynamic> map) {
    can1 = map[tcolumncan1];
    can2 = map[tcolumncan2];
    can3 = map[tcolumncan3];
    can4 = map[tcolumncan4];
    can5 = map[tcolumncan5];
    can6 = map[tcolumncan6];
    can7 = map[tcolumncan7];
    can8 = map[tcolumncan8];
    can9 = map[tcolumncan9];
    can10 = map[tcolumncan10];

  }
  Map<String, dynamic> toMap1() {
    var map1 = <String, dynamic>{
      tcolumncan1: can1,
      tcolumncan2: can2,
      tcolumncan3: can3,
      tcolumncan4: can4,
      tcolumncan5: can5,
      tcolumncan6: can6

    };
    return map1;
  }

  Map<String, dynamic> toMap2() {
    var map2 = <String, dynamic>{



      tcolumncan7: can7,
      tcolumncan8: can8,
      tcolumncan9: can9,
      tcolumncan10: can10


    };
    return map2;
  }
}




class teresahouse{
  static final _databaseName = "Teresa_house.db";
  static final _databaseVersion = 1;

  teresahouse._privateConstructor();
  static final teresahouse instance = teresahouse._privateConstructor();

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
    $tcolumncan1 INTEGER,
    $tcolumncan2 INTEGER,
    $tcolumncan3 INTEGER,
    $tcolumncan4 INTEGER,
    $tcolumncan5 INTEGER,
    $tcolumncan6 INTEGER,
    $tcolumncan7 INTEGER,
    $tcolumncan8 INTEGER,
    $tcolumncan9 INTEGER,
    $tcolumncan10 INTEGER)''');
  }

  Future<int> insertvc(tvotes votes) async {
    Database db = await database;
    int entry = await db.insert(tablename, votes.toMap1());
    return entry;
  }

  Future<int> insertc(tvotes votes) async {
    Database db = await database;
    int entry = await db.insert(tablename, votes.toMap2());
    return entry;
  }


  Future<tvotes> countvotesvc() async {
    Database db = await database;
    int countc1 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan1) FROM $tablename WHERE $tcolumncan1=1'));
    int countc2 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan2) FROM $tablename WHERE $tcolumncan2=1'));
    int countc3 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan3) FROM $tablename WHERE $tcolumncan3=1'));
    int countc4 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan4) FROM $tablename WHERE $tcolumncan4=1'));
    int countc5 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan5) FROM $tablename WHERE $tcolumncan5=1'));
    int countc6 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan6) FROM $tablename WHERE $tcolumncan6=1'));

    at = countc1.toDouble();
    bt = countc2.toDouble();
    ct = countc3.toDouble();
    dt = countc4.toDouble();
    et = countc5.toDouble();
    ft = countc6.toDouble();


  }


  Future<tvotes> countvotesc() async {
    Database db = await database;


    int countc7 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan7) FROM $tablename WHERE $tcolumncan7=1'));
    int countc8 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan8) FROM $tablename WHERE $tcolumncan8=1'));
    int countc9 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan9) FROM $tablename WHERE $tcolumncan9=1'));
    int countc10 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tcolumncan10) FROM $tablename WHERE $tcolumncan10=1'));


    gt = countc7.toDouble();
    ht = countc8.toDouble();
    it = countc9.toDouble();
    jt = countc10.toDouble();



    return null;
  }
  Future cleart() async {

    Database db = await database;
    await db.delete(tablename);



  }
}
