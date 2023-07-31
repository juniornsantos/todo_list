import 'package:todo_list/app/core/database/sqlite_connection_factory.dart';

import './tasks_repository.dart';

class TasksRepositoryImp implements TasksRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  TasksRepositoryImp({required SqliteConnectionFactory sqliteConnectionFactory})
      : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> save(DateTime date, String description) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    await conn.rawInsert(
        'todo',
        {
          'id': null,
          'descricao': description,
          'data_hora': date.toIso8601String(),
          'finalizado': 0
        } as List<Object?>?);
  }
}
