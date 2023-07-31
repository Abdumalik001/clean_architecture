import 'dart:convert';


import 'package:clean_architecture/src/data/api/api_client.dart';
import 'package:clean_architecture/src/domain/models/network/auth_response.dart';

import '../../../domain/data_sources/network/auth_network_data_source.dart';

class AuthNetworkDataSourceImpl extends AuthNetworkDataSource {
  final DioClient _client;

  @override
  Future<AuthResponse> login(
    String username,
    String password,
    String fcmToken,
  ) async {
    final response = await _client.post(
      "api/token/",
      data: {
        "username": username,
        "password": password,
        "fcmToken": fcmToken,
      },
    );
    final decoded = AuthResponse.fromJson(jsonDecode(response.data));
    return decoded;
  }

  @override
  Future<AuthResponse> register(
    String username,
    String password,
    String fcmToken,
  ) async {
    final response = await _client.post(
      "api/register/",
      data: {
        "username": username,
        "password": password,
        "fcmToken": fcmToken,
      },
    );
    final decoded = AuthResponse.fromJson(jsonDecode(response.data));
    return decoded;
  }

  AuthNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;
}
