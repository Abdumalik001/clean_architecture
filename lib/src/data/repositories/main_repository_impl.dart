
import 'package:clean_architecture/src/domain/data_sources/cache/main_data_source.dart';
import 'package:clean_architecture/src/domain/data_sources/network/main_network_data_source.dart';
import 'package:clean_architecture/src/domain/data_sources/storage_service.dart';
import 'package:clean_architecture/src/domain/models/common/app_state.dart';
import 'package:clean_architecture/src/domain/repositories/main_repository.dart';

class MainRepositoryImpl extends MainRepository {
  final MainDataSource _dataSource;
  final MainNetworkDataSource _networkDataSource;
  final StorageService _storageService;

  @override
  Stream<AppState> getAppState() async* {
    yield* _dataSource.getToken().map((event) {
      final token = _storageService.getToken();
      return token == null ? AppState.unAuthorized : AppState.logged;
    });
  }

  @override
  Future<bool> isAuthorized() async {
    return _storageService.getToken() == null ? false : true;
  }

  @override
  Future<bool> refreshFCMToken(String token) async {
    try {
      final res = await _networkDataSource.refreshFCMToken(token);
      return res;
    } catch (e) {
      return false;
    }
  }

  MainRepositoryImpl({
    required MainDataSource dataSource,
    required MainNetworkDataSource networkDataSource,
    required StorageService storageService,
  })  : _dataSource = dataSource,
        _networkDataSource = networkDataSource,
        _storageService = storageService;
}
