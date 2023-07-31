import 'package:bloc/bloc.dart';
import 'package:clean_architecture/src/domain/models/common/app_state.dart';
import 'package:clean_architecture/src/ui/main/splash_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

import '../../../common/utils/bloc.dart';
import '../../../domain/repositories/main_repository.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository _repository;

  MainBloc(
    this._repository,
  ) : super(const MainState()) {
    on<ObserveAppState>(_observeAppStatus);
    on<GetAppStatus>(_getAppStatus,
        transformer: debounceSequential(const Duration(seconds: 3)));

    stream.listen((event) {
      if (state.appState == AppState.unAuthorized) {
        // navigatorKey.currentContext
        //     ?.navigateTo(const SplashScreen(), removeStack: true);

      }
    });
  }

  Future<void> _observeAppStatus(ObserveAppState event, Emitter emitter) {
    return emitter.forEach(
      _repository.getAppState(),
      onData: (data) {
        return state.copyWith(appState: data);
      },
    );
  }

  Future<void> _getAppStatus(GetAppStatus event, Emitter emitter) async {
    final isAuthorized = await _repository.isAuthorized();
    if (isAuthorized) {
      emitter(state.copyWith(appState: AppState.logged));
    } else {
      emitter(state.copyWith(appState: AppState.unAuthorized));
    }
  }
}
