abstract class Settings {
  Future<void> init();

  String jenkinsAddress();

  Future<void> setJenkinsAddress(String jenkinsAddress);
}
