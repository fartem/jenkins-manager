import 'package:jenkins_manager/components/settings/api/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _keyJenkinsAddress = 'jenkins_address';

class SettingsImpl extends Settings {
  late SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  String jenkinsAddress() => _prefs.getString(_keyJenkinsAddress) ?? 'jenkins.io';

  @override
  Future<void> setJenkinsAddress(String jenkinsAddress) async {
    _prefs.setString(
      _keyJenkinsAddress,
      jenkinsAddress,
    );
  }
}
