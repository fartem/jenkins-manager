class JenkinsView {
  final String name;

  JenkinsView._(this.name);

  factory JenkinsView.fromJson(Map<String, dynamic> json) {
    return JenkinsView._(json['name']);
  }
}
