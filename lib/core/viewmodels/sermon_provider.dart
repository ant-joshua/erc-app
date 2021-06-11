import 'package:erc_app/core/di/injector_provider.dart';
import 'package:erc_app/core/models/sermon.dart';
import 'package:erc_app/core/services/sermon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SermonProvider extends ChangeNotifier {
  /// Event handling
  bool _onSearch = false;
  bool get onSearch => _onSearch;

  List<Sermon> availableSermon = [];

  /// Dependency injection
  final _sermonService = inject<SermonService>();

  // Instance SermonProvider
  static SermonProvider instance(BuildContext context) =>
      Provider.of(context, listen: true);

  /// Get Available Sermon from Sermon Service
  void getAvailableSermon() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setOnSearch(true);

    List<Sermon> data = await _sermonService.getSermonAvailable();

    availableSermon = data;
    setOnSearch(false);
  }

  /// Set event search
  void setOnSearch(bool value) {
    _onSearch = value;
    notifyListeners();
  }
}
