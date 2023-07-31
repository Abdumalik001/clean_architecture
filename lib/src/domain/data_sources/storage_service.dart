import 'dart:async';

import 'package:clean_architecture/src/common/resource/keys.dart';
import 'package:hive/hive.dart';

class StorageService {
  late Box _box;
  final StreamController<String> listenable =
      StreamController<String>.broadcast();

  Stream<String> get stream => listenable.stream;

  static Future<StorageService> init() async {
    var instance = StorageService();
    instance._box = await Hive.openBox('app_name');
    return instance;
  }

  void setToken(String token) {
    listenable.add(Keys.token);
    _box.put(Keys.token, token);
  }

  String? getToken() {
    return _box.get(Keys.token, defaultValue: null);
  }

  Future deleteToken() async {
    listenable.add('');
    await _box.delete(Keys.token);
  }

  Future clearStorage() async {
    listenable.add('');
    await Hive.deleteFromDisk();
  }

  Stream<String> listen({String? key}) async* {
    await for (final event in listenable.stream) {
      if (key != null) {
        if (event == key) {
          yield key;
        }
      } else {
        yield event;
      }
    }
  }
}
