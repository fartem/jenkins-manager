import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_view.dart';

abstract class JenkinsApi {
  Future<List<JenkinsView>> fetchJenkinsViewsFrom(
    String url,
    String user,
    String token,
  );
}
