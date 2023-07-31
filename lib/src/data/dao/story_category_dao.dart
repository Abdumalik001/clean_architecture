// import 'package:drift/drift.dart';
// part 'story_category_dao.g.dart';
//
// @DriftAccessor(
//   tables: [
//     StoryCategoryCacheTable,
//   ],
// )
// class StoryCategoryDao extends DatabaseAccessor<AppDatabase>
//     with _$StoryCategoryDaoMixin {
//   StoryCategoryDao(super.attachedDatabase);
//
//   Future<List<StoryCategoryCache>> getCategories() {
//     return select(storyCategoryCacheTable).get();
//   }
//
//   Future<void> insertCategories(List<StoryCategoryCache> categories) async {
//     await batch((batch) {
//       batch.insertAllOnConflictUpdate(storyCategoryCacheTable, categories);
//     });
//   }
//
//   Future<int> clearCategories() async {
//     return await delete(storyCategoryCacheTable).go();
//   }
// }
