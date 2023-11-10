
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionChecker {
  static Future<bool> check() async {
    return await InternetConnectionChecker().hasConnection;
  }
}