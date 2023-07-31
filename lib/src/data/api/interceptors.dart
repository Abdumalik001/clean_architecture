import 'package:clean_architecture/src/core/session/manager/session_manager.dart';
import 'package:dio/dio.dart';


class AuthInterceptor extends Interceptor {
  final SessionManager _sessionManager;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _sessionManager.endLocaleSession();
    }
    super.onError(err, handler);
  }

  AuthInterceptor({
    required SessionManager sessionManager,
  }) : _sessionManager = sessionManager;
}
