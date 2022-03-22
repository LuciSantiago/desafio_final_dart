import 'package:mysql1/mysql1.dart';

class Database {
  Future<MySqlConnection> openConnection() {
    final settings = ConnectionSettings(
        host: 'localhost', port: 3306, user: '', password: '', db: 'ibge');
    return MySqlConnection.connect(settings);
  }
}
