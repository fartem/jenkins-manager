class JenkinsJob {
  final String name;
  final String url;
  final JenkinsJobStatus jenkinsJobStatus;

  JenkinsJob(
    this.name,
    this.url,
    this.jenkinsJobStatus,
  );
}

enum JenkinsJobStatus {
  failed,
  canceled,
  running,
  success,
}
