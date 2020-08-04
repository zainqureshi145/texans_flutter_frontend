import 'dart:async';
import 'dart:io' as io;
import 'package:restaurant_ui_kit/model/CartItems.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'cart.db');
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    print('Database Initialized');
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE cart(itemName TEXT, itemQuantity INTEGER, itemPrice TEXT, itemSize TEXT, itemPicture TEXT, instructions TEXT)");
  }

  Future<int> saveData(CartItems cart) async {
    var dbClient = await db;
    int res = await dbClient.insert('cart', cart.toMap());
    return res;
  }

  Future<void> insertToCart(CartItems cart) async {
    var dbClient = await db;
    await dbClient.insert('cart', cart.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartItems>> getCartData() async {
    print('inside getCartData');
    var dbClient = await db;
    String sql;
    sql = "SELECT * FROM cart";

    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;
    List list = result.map((item) {
      return CartItems.fromMap(item);
    }).toList();

    print(result);
    print(list.length);
    return list;
  }

  Future getTotalPrice() async {
    print('Getting Total Price...');
    var dbClient = await db;
    String sql;
    sql = "SELECT SUM(itemPrice) FROM cart";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;
    int value = result[0]["SUM(itemPrice)"];
    return value;
  }

  Future<int> getCartLength() async {
    print('Getting Cart Length....');
    var dbClient = await db;
    String sql;
    sql = "SELECT * FROM cart";

    var result = await dbClient.rawQuery(sql);
    //if (result.length == 0) return null;

    List<CartItems> list = result.map((item) {
      return CartItems.fromMap(item);
    }).toList();
    int length = list.length;
    return length;
  }

  Future<List<CartItems>> getCartList() async {
    print('Getting Cart Length....');
    var dbClient = await db;
    String sql;
    sql = "SELECT * FROM cart";

    var result = await dbClient.rawQuery(sql);
    //if (result.length == 0) return null;

    List<CartItems> list = result.map((item) {
      return CartItems.fromMap(item);
    }).toList();
    //int length = list.length;
    return list;
  }

  Future<List<CartItems>> deleteDB() async {
    print('inside getCartData');
    var dbClient = await db;
    String sql;
    sql = "DELETE FROM cart";

    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;

    List<CartItems> list = result.map((item) {
      return CartItems.fromMap(item);
    }).toList();
    print(result);
    return list;
  }

//  deleteCartDatabase() async {
//    var path = join(await getDatabasesPath(), 'cart.db');
//    await deleteDatabase(path);
//    print('Database Deleted...');
//  }

//  deleteDB() async {
//    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//    String path = join(documentsDirectory.path, 'cart.db');
//    _db.close();
//    await deleteDatabase(path);
//    print('Database Deleted...');
//  }
}
