import 'package:erc_app/core/di/http_client.dart';
import 'package:erc_app/core/di/injector_provider.dart';
import 'package:erc_app/core/dto/login_request_dto.dart';
import 'package:erc_app/core/helpers/storage.helpers.dart';

class AuthService {
  final httpClient = inject<HttpClient>();

  Future<String> login(LoginRequestDto loginRequest) async {
    final response = await httpClient.post(
      "${httpClient.baseUrl}/auth/login",
      body: loginRequest.toJson(),
    );
    final accessToken = response.data['accessToken'] ?? '';
    print(accessToken);
    // StorageHelper.set("Token", value)

    return accessToken;
  }
}
