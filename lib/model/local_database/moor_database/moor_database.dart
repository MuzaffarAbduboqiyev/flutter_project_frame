import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_core/model/category_model/category_table.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'moor_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(
  tables: [
    Category,
  ],
  include: {'tables.drift'},
)
class MoorDatabase extends _$MoorDatabase {
  MoorDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<CategoryData>> getCategories() => select(category).get();

  Stream<List<CategoryData>> listenCategory() => select(category).watch();

  Future<int> insertOrUpdateCategory({required CategoryData categoryData}) =>
      into(category).insert(
        categoryData,
        mode: InsertMode.insertOrReplace,
      );

  Future<int> deleteCategory({required CategoryData categoryData}) =>
      (delete(category)
            ..where(
              (categoryItem) => categoryItem.name.equals(categoryData.name),
            ))
          .go();

  Future<int> clearCategory() => delete(category).go();
}
