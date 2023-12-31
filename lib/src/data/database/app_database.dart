import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


part 'app_database.g.dart';

@DriftDatabase(tables: [
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final path = await getApplicationDocumentsDirectory();
      final file = File(p.join(path.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file, logStatements: true);
    },
  );
}
