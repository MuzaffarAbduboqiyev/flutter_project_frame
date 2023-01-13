import 'package:flutter_core/model/local_database/moor_database/moor_database.dart';
import 'package:flutter_core/model/response_model/network_response_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryData>> getCategories();

  Stream<List<CategoryData>> listenCategory();

  Future<SimpleResponseModel> insertOrUpdateCategory({
    required CategoryData categoryData,
  });

  Future<SimpleResponseModel> deleteCategory({
    required CategoryData categoryData,
  });

  Future<SimpleResponseModel> clearCategory();
}

class CategoryRepositoryImpl extends CategoryRepository {
  final MoorDatabase moorDatabase;

  CategoryRepositoryImpl({
    required this.moorDatabase,
  });

  @override
  Future<SimpleResponseModel> clearCategory() async {
    await moorDatabase.clearCategory();
    return SimpleResponseModel.success();
  }

  @override
  Future<SimpleResponseModel> deleteCategory(
      {required CategoryData categoryData}) async {
    await moorDatabase.deleteCategory(categoryData: categoryData);
    return SimpleResponseModel.success();
  }

  @override
  Future<List<CategoryData>> getCategories() =>
      moorDatabase.getCategories();

  @override
  Future<SimpleResponseModel> insertOrUpdateCategory(
      {required CategoryData categoryData}) async {
    await moorDatabase.insertOrUpdateCategory(
        categoryData: categoryData);
    return SimpleResponseModel.success();
  }

  @override
  Stream<List<CategoryData>> listenCategory() =>
      moorDatabase.listenCategory();
}
