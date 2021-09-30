import 'package:stacked/stacked.dart';

import '../../components/settings/api/settings.dart';

class SettingsPageViewModel extends BaseViewModel {
  final Settings settings;

  late String address;
  late String user;
  late String token;

  SettingsPageViewModel({required this.settings}) {
    final jenkinsCredentials = settings.jenkinsCredentials();
    address = jenkinsCredentials.address;
    user = jenkinsCredentials.user;
    token = jenkinsCredentials.token;
  }

  JenkinsCredentials jenkinsCredentials() => settings.jenkinsCredentials();

  Future<void> setJenkinsCredentials() async {
    settings.setJenkinsCredentials(
      jenkinsCredentials: JenkinsCredentials(
        address: address,
        user: user,
        token: token,
      ),
    );
  }
}
