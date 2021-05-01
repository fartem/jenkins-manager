import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_view.dart';
import 'package:jenkins_manager/components/settings/api/settings.dart';

abstract class JenkinsApi {
  Future<List<JenkinsView>> fetchJenkinsViewsFrom(
    JenkinsCredentials jenkinsCredentials,
  );
}
