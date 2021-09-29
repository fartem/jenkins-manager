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
        address: _prefs.getString(_keyJenkinsAddress) ?? _defaultJenkinsAddress,
        user: _prefs.getString(_keyJenkinsUser) ?? _defaultJenkinsUser,
        token: _prefs.getString(_keyJenkinsToken) ?? _defaultJenkinsToken,
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
  Future<void> setJenkinsCredentials({
    required JenkinsCredentials jenkinsCredentials,
  }) async {
    _jenkinsCredential.value = jenkinsCredentials;
    _prefs.setString(
      _keyJenkinsAddress,
      jenkinsCredentials.address,
    );
    _prefs.setString(
      _keyJenkinsUser,
      jenkinsCredentials.user,
    );
    _prefs.setString(
      _keyJenkinsToken,
      jenkinsCredentials.token,
    );
  }
}
