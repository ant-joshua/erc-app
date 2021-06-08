import 'package:erc_app/core/di/http_client.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjector() async {
  /// Components
  inject.registerSingleton(HttpClient());

  /// Registering Utils

  /// Remote Services

  /// Repositories

  /// ViewModels
}
