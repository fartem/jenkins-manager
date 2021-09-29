import '../../settings/api/settings.dart';
import 'entities/jenkins_job.dart';
import 'entities/jenkins_view.dart';

abstract class JenkinsApi {
  Future<List<JenkinsView>> jenkinsViews({
    required JenkinsCredentials jenkinsCredentials,
  });

  Future<List<JenkinsJob>> jenkinsJobs({
    required JenkinsCredentials jenkinsCredentials,
    required JenkinsView jenkinsView,
  });

  Future<bool> runJenkinsJob({
    required JenkinsCredentials jenkinsCredentials,
    required JenkinsJob jenkinsJob,
  });
}
