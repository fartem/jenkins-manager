import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_view.dart';

import 'jenkins_job.dart';

abstract class JenkinsApi {
  Future<List<JenkinsView>> fetchJenkinsViewsFrom(String url);

  Future<List<JenkinsJob>> fetchJenkinsJobsFrom(JenkinsView jenkinsView);
}
