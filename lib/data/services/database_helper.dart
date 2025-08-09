import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:omne_vendor/data/models/vendor_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'vendor_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE vendors(
            vendorId INTEGER PRIMARY KEY,
            name TEXT,
            location TEXT,
            rating REAL,
            category TEXT,
            imageUrl TEXT,
            isFavorite INTEGER DEFAULT 0
          )
        ''');

        await db.execute('''
          CREATE TABLE favorites(
            vendorId INTEGER PRIMARY KEY,
            name TEXT,
            location TEXT,
            rating REAL,
            category TEXT,
            imageUrl TEXT,
            isFavorite INTEGER DEFAULT 0
          )
        ''');
      },
    );
  }

  Future<void> insertVendors(List<VendorModel> vendors) async {
    final db = await database;
    await db.delete('vendors');
    for (var vendor in vendors) {
      await db.insert(
        'vendors',
        vendor.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<VendorModel>> getVendors() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('vendors');
    return List.generate(maps.length, (i) => VendorModel.fromMap(maps[i]));
  }

  Future<void> addFavorite(VendorModel vendor) async {
    final db = await database;
    await db.insert(
      'favorites',
      vendor.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeFavorite(int vendorId) async {
    final db = await database;
    await db.delete('favorites', where: 'vendorId = ?', whereArgs: [vendorId]);
  }

  Future<List<VendorModel>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return List.generate(maps.length, (i) => VendorModel.fromMap(maps[i]));
  }
}
