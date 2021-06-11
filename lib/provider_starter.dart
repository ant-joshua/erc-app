import 'package:erc_app/core/viewmodels/auth_provider.dart';
import 'package:erc_app/core/viewmodels/sermon_provider.dart';
import 'package:provider/provider.dart';

class ProviderStarter {
  static Future register() async => [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SermonProvider(),
        ),
      ];
}
