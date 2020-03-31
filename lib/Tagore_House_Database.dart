import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';




double ata=0;
double bta=0;
double cta=0;
double dta =0;
double eta=0;
double fta=0;
double gta=0;
double hta=0;
double ita =0;
double jta=0;
double kta=0;


//6 captains 5 vice captains
final String tablename = 'tagore';
final String tacolumncan1 = 'can1';
final String tacolumncan2 = 'can2';
final String tacolumncan3 = 'can3';
final String tacolumncan4 = 'can4';
final String tacolumncan5 = 'can5';
final String tacolumncan6 = 'can6';
final String tacolumncan7 = 'can7';
final String tacolumncan8 = 'can8';
final String tacolumncan9 = 'can9';
final String tacolumncan10 = 'can10';
final String tacolumncan11 = 'can11';

class tavotes {
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
  tavotes();
  // convenience constructor to create a Word object
  tavotes.fromMap(Map<String, dynamic> map) {
    can1 = map[tacolumncan1];
    can2 = map[tacolumncan2];
    can3 = map[tacolumncan3];
    can4 = map[tacolumncan4];
    can5 = map[tacolumncan5];
    can6 = map[tacolumncan6];
    can7 = map[tacolumncan7];
    can8 = map[tacolumncan8];
    can9 = map[tacolumncan9];
    can10 = map[tacolumncan10];
    can11 = map[tacolumncan11];
  }
  Map<String, dynamic> toMap1() {
    var map1 = <String, dynamic>{
      tacolumncan1: can1,
      tacolumncan2: can2,
      tacolumncan3: can3,
      tacolumncan4: can4,
      tacolumncan5: can5

    };
    return map1;
  }

  Map<String, dynamic> toMap2() {
    var map2 = <String, dynamic>{


      tacolumncan6: can6,
      tacolumncan7: can7,
      tacolumncan8: can8,
      tacolumncan9: can9,
      tacolumncan10: can10,
      tacolumncan11: can11

    };
    return map2;
  }
}




class tagorehouse{
  static final _databaseName = "Tagore_house.db";
  static final _databaseVersion = 1;

  tagorehouse._privateConstructor();
  static final tagorehouse instance = tagorehouse._privateConstructor();

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
    $tacolumncan1 INTEGER,
    $tacolumncan2 INTEGER,
    $tacolumncan3 INTEGER,
    $tacolumncan4 INTEGER,
    $tacolumncan5 INTEGER,
    $tacolumncan6 INTEGER,
    $tacolumncan7 INTEGER,
    $tacolumncan8 INTEGER,
    $tacolumncan9 INTEGER,
    $tacolumncan10 INTEGER,
    $tacolumncan11 INTEGER)''');
  }

  Future<int> insertvc(tavotes votes) async {
    Database db = await database;
    int entry = await db.insert(tablename, votes.toMap1());
    return entry;
  }

  Future<int> insertc(tavotes votes) async {
    Database db = await database;
    int entry = await db.insert(tablename, votes.toMap2());
    return entry;
  }


  Future<tavotes> countvotesvc() async {
    Database db = await database;
    int countc1 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan1) FROM $tablename WHERE $tacolumncan1=1'));
    int countc2 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan2) FROM $tablename WHERE $tacolumncan2=1'));
    int countc3 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan3) FROM $tablename WHERE $tacolumncan3=1'));
    int countc4 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan4) FROM $tablename WHERE $tacolumncan4=1'));
    int countc5 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan5) FROM $tablename WHERE $tacolumncan5=1'));

    ata = countc1.toDouble();
    bta = countc2.toDouble();
    cta = countc3.toDouble();
    dta = countc4.toDouble();
    eta = countc5.toDouble();


  }


  Future<tavotes> countvotesc() async {
    Database db = await database;

    int countc6 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan6) FROM $tablename WHERE $tacolumncan6=1'));
    int countc7 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan7) FROM $tablename WHERE $tacolumncan7=1'));
    int countc8 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan8) FROM $tablename WHERE $tacolumncan8=1'));
    int countc9 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan9) FROM $tablename WHERE $tacolumncan9=1'));
    int countc10 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan10) FROM $tablename WHERE $tacolumncan10=1'));
    int countc11 = Sqflite
        .firstIntValue(await db.rawQuery('SELECT COUNT($tacolumncan11) FROM $tablename WHERE $tacolumncan11=1'));

    fta = countc6.toDouble();
    gta = countc7.toDouble();
    hta = countc8.toDouble();
    ita = countc9.toDouble();
    jta = countc10.toDouble();
    kta = countc11.toDouble();



  }

  Future clearta() async {

    Database db = await database;
    await db.delete(tablename);



  }
}
