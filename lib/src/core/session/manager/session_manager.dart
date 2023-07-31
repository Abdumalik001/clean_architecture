import '../session.dart';

abstract class SessionManager extends Session {
  Future endRemoteSession();

  Future endLocaleSession();
}
