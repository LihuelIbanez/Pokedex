import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectionHandler {
  Future<bool> hasConnection();
}

class ConnectionHandlerImpl implements ConnectionHandler {
  @override
  Future<bool> hasConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
