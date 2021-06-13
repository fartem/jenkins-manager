import 'package:stacked/stacked.dart';

import '../../components/navigator/navigator_service.dart';
import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';

class SettingsPageViewModel extends ReactiveViewModel {
  final NavigatorService _navigatorService = locator<NavigatorService>();
  final Settings _settings = locator<Settings>();

  late String address;
  late String user;
  late String token;

  SettingsPageViewModel() {
    final jenkinsCredentials = _settings.jenkinsCredentials();
    address = jenkinsCredentials.address;
    user = jenkinsCredentials.user;
    token = jenkinsCredentials.token;
  }

  JenkinsCredentials jenkinsCredentials() => _settings.jenkinsCredentials();

  Future<void> setJenkinsCredentials() async {
    _settings.setJenkinsCredentials(
      JenkinsCredentials(
        address,
        user,
        token,
      ),
    );
    _navigatorService.back();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_settings];
}
