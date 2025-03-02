import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/CatModel.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance  = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper(){
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database?> get database async{
    if(_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async{
    String path = join(await getDatabasesPath(), 'cat_database.db');
    return await openDatabase(
      path, 
      version: 1, 
      onCreate: (db, version) async{
        await db.execute('''
          CREATE TABLE cats(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER,
            color TEXT,
            breed TEXT,
            weight REAL
          )
        ''');
      },
    );
  }

  Future<int> insertCat(CatModel cat) async{
    final db = await database;
    return await db!.insert('cats', cat.toMap());
  }

  Future<List<CatModel>> listCats() async {
    final db = await database;
    List<Map<String, dynamic>> maps=[];
    try{
      maps = await db!.query('cats');
    }catch(error){
      print('Error: $error');
    }
    return List.generate(maps.length, (i) => CatModel.fromMap(maps[i]));
  }

}

