// ignore: depend_on_referenced_packages
import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list/app/core/database/migrations/migration.dart';

class MigrationV2 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('create table teste(id Intege)');
  }

  @override
  void update(Batch batch) {
    batch.execute('create table teste(id Intege)');
  }
}
