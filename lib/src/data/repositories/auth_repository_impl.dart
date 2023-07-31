
import 'package:clean_architecture/src/domain/data_sources/network/auth_network_data_source.dart';
import 'package:clean_architecture/src/domain/models/common/domain_result.dart';
import 'package:clean_architecture/src/domain/repositories/auth_repository.dart';

import '../../domain/data_sources/storage_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthNetworkDataSource _networkDataSource;
  final StorageService _storageService;

  @override
  Stream<DomainResult> login(String username, String password) async* {
    try {
      yield DomainLoading();
      if (username.trim().isEmpty) yield DomainFail();
      if (password.trim().isEmpty) yield DomainFail();

      final res =
          await _networkDataSource.login(username.trim(), password.trim(), "");
      _storageService.setToken('access');

      yield DomainSuccess();
    } catch (e) {
      yield DomainFail();
    }
  }

  @override
  Stream<DomainResult> register(String username, String password) async* {
    try {
      yield DomainLoading();
      if (username.trim().isEmpty) yield DomainFail();
      if (password.trim().isEmpty) yield DomainFail();

      // final res = await _networkDataSource.register(
      //   username.trim(),
      //   password.trim(),
      //   "",
      // );
      _storageService.setToken('access');

      yield DomainSuccess();
    } catch (e) {
      yield DomainFail();
    }
  }

  AuthRepositoryImpl({
    required AuthNetworkDataSource networkDataSource,
    required StorageService storageService,
  })  : _networkDataSource = networkDataSource,
        _storageService = storageService;
}
