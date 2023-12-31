// import 'package:drift/drift.dart';
//
// part 'story_dao.g.dart';
//
// @DriftAccessor(tables: [
//   StoryCacheTable,
// ])
// class StoryDao extends DatabaseAccessor<AppDatabase> with _$StoryDaoMixin {
//   StoryDao(super.attachedDatabase);
//
//   Future<List<StoryCache>> getStories(int categoryId) {
//     return (select(storyCacheTable)
//           ..where((tbl) => tbl.categoryId.equals(categoryId)))
//         .get();
//   }
//
//   Future<void> insertStories(List<StoryCache> stories) async {
//     await batch((batch) {
//       batch.insertAllOnConflictUpdate(storyCacheTable, stories);
//     });
//   }
//
//   Future<int> clearStories(int categoryId) async {
//     return await (delete(storyCacheTable)
//           ..where((tbl) => tbl.categoryId.equals(categoryId)))
//         .go();
//   }
// }
