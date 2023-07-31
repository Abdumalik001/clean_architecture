
import 'package:clean_architecture/src/domain/data_sources/storage_service.dart';

import '../../../domain/data_sources/cache/profile_cache_data_source.dart';

class ProfileCacheDataSourceImpl extends ProfileCacheDataSource {
  final StorageService _storageService;

  @override
  Future<void> clearAllCache() {
    return _storageService.clearStorage();
  }

  ProfileCacheDataSourceImpl({
    required StorageService storageService,
  }) : _storageService = storageService;
}
