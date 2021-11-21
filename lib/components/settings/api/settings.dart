import 'package:stacked/stacked.dart';

abstract class Settings with ReactiveServiceMixin {
  Future<void> init();

  JenkinsCredentials jenkinsCredentials();

  Future<void> setJenkinsCredentials({
    required JenkinsCredentials jenkinsCredentials,
  });
}

class JenkinsCredentials {
  final String address;
  final String user;
  final String token;

  JenkinsCredentials({
    required this.address,
    required this.user,
    required this.token,
  });
}
