
import 'package:clean_architecture/src/domain/data_sources/cache/main_data_source.dart';
import 'package:clean_architecture/src/domain/data_sources/storage_service.dart';

class MainDataSourceImpl extends MainDataSource {
  final StorageService _storageService;

  @override
  Stream<String> getToken() => _storageService.stream;

  MainDataSourceImpl({
    required StorageService storageService,
  }) : _storageService = storageService;
}
