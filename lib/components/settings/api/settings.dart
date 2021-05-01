abstract class Settings {
  Future<void> init();

  String jenkinsAddress();

  Future<void> setJenkinsAddress(String jenkinsAddress);

  String jenkinsUser();

  Future<void> setJenkinsUser(String jenkinsUser);

  String jenkinsToken();

  Future<void> setJenkinsToken(String jenkinsToken);
}
