import 'package:flutter/cupertino.dart';
import 'package:todo_list/app/core/database/sqlite_connection_factory.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final conection = SqliteConnectionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        conection.closeConnection();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}


// Rever a aula 09