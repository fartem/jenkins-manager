import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../api/settings.dart';

const _keyJenkinsAddress = 'jenkins_address';
const _keyJenkinsUser = 'jenkins_user';
const _keyJenkinsToken = 'jenkins_token';

const _defaultJenkinsAddress = 'jenkins.io';
const _defaultJenkinsUser = 'jenkins';
const _defaultJenkinsToken = 'jenkins_token';

class SettingsImpl extends Settings {
  late SharedPreferences _prefs;

  late ReactiveValue<JenkinsCredentials> _jenkinsCredential;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _jenkinsCredential = ReactiveValue(
      JenkinsCredentials(
        _jenkinsAddress(),
        _jenkinsUser(),
        _jenkinsToken(),
      ),
    );
    listenToReactiveValues(
      [
        _jenkinsCredential,
      ],
    );
  }

  @override
  JenkinsCredentials jenkinsCredentials() => _jenkinsCredential.value;

  @override
  Future<void> setJenkinsCredentials(JenkinsCredentials jenkinsCredentials) async {
    _jenkinsCredential.value = jenkinsCredentials;
    _setJenkinsAddress(jenkinsCredentials.address);
    _setJenkinsUser(jenkinsCredentials.user);
    _setJenkinsToken(jenkinsCredentials.token);
  }

  String _jenkinsAddress() => _prefs.getString(_keyJenkinsAddress) ?? _defaultJenkinsAddress;

  Future<void> _setJenkinsAddress(String jenkinsAddress) async {
    _prefs.setString(
      _keyJenkinsAddress,
      jenkinsAddress,
    );
  }

  String _jenkinsUser() => _prefs.getString(_keyJenkinsUser) ?? _defaultJenkinsUser;

  Future<void> _setJenkinsUser(String jenkinsUser) async {
    _prefs.setString(
      _keyJenkinsUser,
      jenkinsUser,
    );
  }

  String _jenkinsToken() => _prefs.getString(_keyJenkinsToken) ?? _defaultJenkinsToken;

  Future<void> _setJenkinsToken(String jenkinsToken) async {
    _prefs.setString(
      _keyJenkinsToken,
      jenkinsToken,
    );
  }
}
