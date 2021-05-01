import 'package:jenkins_manager/components/settings/api/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _keyJenkinsAddress = 'jenkins_address';
const _keyJenkinsUser = 'jenkins_user';
const _keyJenkinsToken = 'jenkins_token';

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

  @override
  String jenkinsUser() => _prefs.getString(_keyJenkinsUser) ?? 'jenkins';

  @override
  Future<void> setJenkinsUser(String jenkinsUser) async {
    _prefs.setString(
      _keyJenkinsUser,
      jenkinsUser,
    );
  }

  @override
  String jenkinsToken() => _prefs.getString(_keyJenkinsToken) ?? 'jenkins_token';

  @override
  Future<void> setJenkinsToken(String jenkinsToken) async {
    _prefs.setString(
      _keyJenkinsToken,
      jenkinsToken,
    );
  }
}
