import 'package:erc_app/core/di/http_client.dart';
import 'package:erc_app/core/di/injector_provider.dart';
import 'package:erc_app/core/models/sermon.dart';

class SermonService {
  final httpClient = inject<HttpClient>();
  Future<List<Sermon>> getSermonAvailable() async {
    final response = await httpClient.get(
      "${httpClient.baseUrl}/sermons/available",
    );

    final responseBody = response.data['data'] as List;
    Iterable list = responseBody;

    List<Sermon> data = list.map((model) => Sermon.fromJson(model)).toList();
    return data;
  }
}
