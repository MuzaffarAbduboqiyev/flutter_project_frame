import 'package:drift/drift.dart';

class Category extends Table {
  TextColumn get name => text()();

  IntColumn get parentId => integer()();

  IntColumn get position => integer()();

  @override
  Set<Column>? get primaryKey => {name};
}
