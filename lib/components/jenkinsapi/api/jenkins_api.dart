import '../../settings/api/settings.dart';
import 'entities/jenkins_job.dart';
import 'entities/jenkins_view.dart';

abstract class JenkinsApi {
  Future<List<JenkinsView>> jenkinsViews(
    JenkinsCredentials jenkinsCredentials,
  );

  Future<List<JenkinsJob>> jenkinsJobs(
    JenkinsCredentials jenkinsCredentials,
    JenkinsView jenkinsView,
  );

  Future<bool> runJenkinsJob(
    JenkinsCredentials jenkinsCredentials,
    JenkinsJob jenkinsJob,
  );
}
