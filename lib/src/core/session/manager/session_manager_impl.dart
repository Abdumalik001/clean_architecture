
import 'package:clean_architecture/src/domain/data_sources/storage_service.dart';

import 'session_manager.dart';

class SessionManagerImpl extends SessionManager {
  final StorageService _storageService;

  SessionManagerImpl({
    required StorageService storageService,
  }) : _storageService = storageService;

  @override
  String? get accessToken => _storageService.getToken() != null
      ? "Bearer ${_storageService.getToken()}"
      : null;

  @override
  String get authorization => "Authorization";

  @override
  Future endLocaleSession() async {
    await _storageService.clearStorage();
  }

  @override
  Future endRemoteSession() async {}

  @override
  int get timeout => 30000;

  @override
  bool validate(int code) {
    if (code >= 200 && code <= 400) {
      return true;
    } else {
      return false;
    }
  }
}
