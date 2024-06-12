import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseConnection{

  Future<Database> setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path,'db_crud');
    var database = await openDatabase(path,version: 1,onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase (Database database, int version) async{
    String sql = "CREATE TABLE product(id INTEGER PRIMARY KEY,productName TEXT,productImage TEXT,productDesc TEXT);";
    await database.execute(sql);
  }
}