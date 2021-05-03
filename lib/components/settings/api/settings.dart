import 'package:stacked/stacked.dart';

abstract class Settings with ReactiveServiceMixin {
  Future<void> init();

  JenkinsCredentials jenkinsCredentials();

  Future<void> setJenkinsCredentials(
    JenkinsCredentials jenkinsCredentials,
  );
}

class JenkinsCredentials {
  final String address;
  final String user;
  final String token;

  JenkinsCredentials(
    this.address,
    this.user,
    this.token,
  );
}
