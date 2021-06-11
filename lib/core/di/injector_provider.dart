import 'package:erc_app/core/di/http_client.dart';
import 'package:erc_app/core/services/auth_service.dart';
import 'package:erc_app/core/services/sermon_service.dart';
import 'package:erc_app/core/utils/navigation/navigation.utils.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjector() async {
  /// Components
  inject.registerSingleton(HttpClient());

  /// Registering Utils
  inject.registerSingleton(NavigationUtils());

  /// Remote Services
  inject.registerSingleton(AuthService());
  inject.registerSingleton(SermonService());

  /// Repositories

  /// ViewModels
}
