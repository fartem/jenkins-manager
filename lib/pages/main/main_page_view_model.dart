import 'package:flutter/material.dart';

import '../../components/navigator/navigator_service.dart';
import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';
import '../../main.router.dart';
import 'main_page.dart';

class MainPageViewModel extends ChangeNotifier {
  final _settings = locator<Settings>();

  var state = MainPageViewModelState.loading;

  Future<void> init() async {
    await _settings.init();
    state = MainPageViewModelState.loaded;
    notifyListeners();
  }

  void onSettingsPress(BuildContext context) => locator<NavigatorService>().navigateTo(
        routeName: Routes.settingsPage,
      );
}
