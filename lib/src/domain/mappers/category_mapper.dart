

import 'package:clean_architecture/src/domain/models/network/category_response.dart';

import '../models/ui/category.dart';
import 'base_mapper.dart';

class CategoryMapper extends Mapper<CategoryResponse, Category> {
  @override
  Category map(CategoryResponse data) {
    return Category(
      id: data.id,
      name: "#${data.name}(${data.count})",
      count: data.count,
    );
  }
}

