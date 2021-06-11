import 'package:erc_app/core/di/injector_provider.dart';
import 'package:erc_app/core/dto/login_request_dto.dart';
import 'package:erc_app/core/helpers/storage.helpers.dart';
import 'package:erc_app/core/services/auth_service.dart';
import 'package:erc_app/core/utils/navigation/navigation.utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier with Navigation {
  /// Event handling
  bool _onSearch = false;
  bool get onSearch => _onSearch;

  /// Dependency injection
  final _authService = inject<AuthService>();

  ///=========================
  /// This is function logic
  ///=========================
  /// Instance provider
  static AuthProvider instance(BuildContext context) =>
      Provider.of(context, listen: false);

  /// Write your function in here
  void login(LoginRequestDto loginRequestDto) async {
    setOnSearch(true);
    String accessToken = await _authService.login(loginRequestDto);
    print("provider : " + accessToken);
    if (accessToken != '') {
      StorageHelper.set("Token", accessToken);
      navigate.pushToRemoveUntil("/");
      // TODO : Navigasi ke halaman main screen
    } else {
      // TODO: Munculin dialog username / password salah kalau gagal login
    }
    setOnSearch(false);
  }

  /// Set event search
  void setOnSearch(bool value) {
    _onSearch = value;
    notifyListeners();
  }
}
