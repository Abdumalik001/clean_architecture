import 'package:clean_architecture/src/core/session/manager/session_manager.dart';
import 'package:clean_architecture/src/core/session/manager/session_manager_impl.dart';
import 'package:clean_architecture/src/data/api/api_client.dart';
import 'package:clean_architecture/src/data/api/interceptors.dart';
import 'package:clean_architecture/src/data/data_sources/cache/main_data_source_impl.dart';
import 'package:clean_architecture/src/data/data_sources/network/main_network_data_source_impl.dart';
import 'package:clean_architecture/src/data/repositories/auth_repository_impl.dart';
import 'package:clean_architecture/src/data/repositories/main_repository_impl.dart';
import 'package:clean_architecture/src/domain/data_sources/cache/main_data_source.dart';
import 'package:clean_architecture/src/domain/data_sources/cache/profile_cache_data_source.dart';
import 'package:clean_architecture/src/domain/data_sources/storage_service.dart';
import 'package:clean_architecture/src/domain/repositories/main_repository.dart';
import 'package:get_it/get_it.dart';

import '../data/data_sources/cache/profile_cache_data_source_impl.dart';
import '../data/data_sources/network/auth_network_data_source_impl.dart';
import '../domain/data_sources/network/auth_network_data_source.dart';
import '../domain/data_sources/network/main_network_data_source.dart';
import '../domain/repositories/auth_repository.dart';

final locator = GetIt.instance;

Future setUpDependencies() async {
  locator.registerSingleton<StorageService>(
    await StorageService.init(),
  );
  locator.registerSingleton<SessionManager>(
    SessionManagerImpl(storageService: locator.get()),
  );
  locator.registerSingleton<AuthInterceptor>(
    AuthInterceptor(sessionManager: locator.get()),
  );
  locator.registerSingleton<DioClient>(
    DioClient(locator.get()),
  );

  _initCacheDataSources();
  _setUpNetworkDataSources();
  _setupRepositories();
}

void _initCacheDataSources() {
  locator.registerSingleton<ProfileCacheDataSource>(
    ProfileCacheDataSourceImpl(storageService: locator.get()),
  );
}

void _setUpNetworkDataSources() {
  locator.registerSingleton<AuthNetworkDataSource>(
    AuthNetworkDataSourceImpl(client: locator.get()),
  );
  locator.registerSingleton<MainDataSource>(
    MainDataSourceImpl(storageService: locator.get()),
  );
  locator.registerSingleton<MainNetworkDataSource>(
    MainNetworkDataSourceImpl(client: locator.get()),
  );
}

void _setupRepositories() {
  locator.registerSingleton<MainRepository>(
    MainRepositoryImpl(
      dataSource: locator.get(),
      networkDataSource: locator.get(),
      storageService: locator.get(),
    ),
  );
  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      networkDataSource: locator.get(),
      storageService: locator.get(),
    ),
  );
}
