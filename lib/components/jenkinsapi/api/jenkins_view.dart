import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_job.dart';

class JenkinsView {
  final String name;
  final List<JenkinsJob> jenkinsJobs;

  JenkinsView._(
    this.name,
    this.jenkinsJobs,
  );

  factory JenkinsView.fromJson(Map<String, dynamic> json) {
    final jenkinsJobs = <JenkinsJob>[];
    final rawJenkinsJobs = json['jobs'] ?? [];
    for (final rawJenkinsJob in rawJenkinsJobs) {
      jenkinsJobs.add(JenkinsJob.fromJson(rawJenkinsJob));
    }
    return JenkinsView._(
      json['name'],
      jenkinsJobs,
    );
  }
}
