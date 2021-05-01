class JenkinsJob {
  final String name;
  final String url;
  final JenkinsJobStatus jenkinsJobStatus;

  JenkinsJob._(
    this.name,
    this.url,
    this.jenkinsJobStatus,
  );

  factory JenkinsJob.fromJson(Map<String, dynamic> json) {
    final lastBuild = json['lastBuild'];
    final status = lastBuild?['result'] ?? 'NOT_BUILD';
    return JenkinsJob._(
      json['name'],
      '',
      JenkinsJobStatus.values.firstWhere(
        (s) => s.toString().contains(status.toLowerCase()),
        orElse: () => JenkinsJobStatus.not_build,
      ),
    );
  }
}

enum JenkinsJobStatus {
  aborted,
  not_build,
  failure,
  unstable,
  success,
}
