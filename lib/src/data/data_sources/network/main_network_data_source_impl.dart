
import '../../../domain/data_sources/network/main_network_data_source.dart';
import '../../api/api_client.dart';

class MainNetworkDataSourceImpl extends MainNetworkDataSource {
  final DioClient _client;

  @override
  Future<bool> refreshFCMToken(String token) async {
    final result = await _client.post(
      "api/v1/user/notification/refreshToken",
      data: {
        "token": token,
      },
    );
    return result.isSuccessful;
  }

  MainNetworkDataSourceImpl({
    required DioClient client,
  }) : _client = client;
}
