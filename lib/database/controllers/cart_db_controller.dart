import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/database/db_operations.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:sqflite/sqflite.dart';

class CartDbController extends DbOperations<Cart> {

  @override
  Future<int> create(Cart model) async {
    // User add new Item for the first time to the cart
    return await database.insert(Cart.tableName, model.toJson());
  }

  @override
  Future<bool> delete(String id) async {
    int countOfDeletedRows = await database.delete(
      Cart.tableName,
      where: 'product_id = ?',
      whereArgs: [id],
    );
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<Cart>> read() async {
    List<Map<String, dynamic>> rowsMap = await database.query(
      Cart.tableName,
    );
    print(rowsMap);
    return rowsMap.map((rowMap) => Cart.fromJson(rowMap)).toList();
  }

  @override
  Future<Cart?> show(int id) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Cart model) async {
    int countOfUpdatedRows = await database.update(
      Cart.tableName,
      model.toJson(),
      where: 'product_id = ?',
      whereArgs: [model.productId],
    );
    return countOfUpdatedRows == 1;
  }

  Future<double> getTotal() async {
    var result = await database.rawQuery("SELECT SUM(price) FROM ${Cart.tableName}");
    var value = result[0]["SUM(price)"];
    return double.parse(value.toString());
  }

  Future<int> getQuantity() async {
    var result = await database.rawQuery("SELECT SUM(quantity) FROM ${Cart.tableName}");
    var value = result[0]["SUM(quantity)"];
    return int.parse(value.toString());
  }

  @override
  Future<bool> clear() async {
    int countOfDeletedRows = await database.delete(
      Cart.tableName,
    );
    return countOfDeletedRows > 0;
  }
}
