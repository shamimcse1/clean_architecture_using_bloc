
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/product_model.dart';


abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getProducts();
  Future<void> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  static const _databaseName = "app.db";
  static const _tableName = "products";

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, price REAL, description TEXT, image TEXT)",
        );
      },
    );
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var product in products) {
        await txn.insert(
          _tableName,
          {
            'id': product.id,
            'title': product.title,
            'price': product.price,
            'description': product.description,
            'image': product.image,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return ProductModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
        description: maps[i]['description'],
        image: maps[i]['image'],
      );
    });
  }
}