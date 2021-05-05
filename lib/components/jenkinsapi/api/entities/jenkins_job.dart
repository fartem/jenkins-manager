import 'package:json_annotation/json_annotation.dart';

import 'jenkins_build.dart';

part 'jenkins_job.g.dart';

@JsonSerializable()
class JenkinsJob {
  final String name;
  final String? description;

  @JsonKey(fromJson: _healthFromJson)
  final String? healthReport;

  final String? labelExpression;
  final String url;

  @JsonKey(fromJson: _jenkinsBuildFromJson)
  final JenkinsBuild? lastBuild;

  JenkinsJob(
    this.name,
    this.description,
    this.healthReport,
    this.labelExpression,
    this.url,
    this.lastBuild,
  );

  factory JenkinsJob.fromJson(Map<String, dynamic> json) => _$JenkinsJobFromJson(json);
}

String? _healthFromJson(List<dynamic>? json) {
  if (json == null || json.isEmpty) {
    return null;
  }
  return json.first['description'];
}

JenkinsBuild? _jenkinsBuildFromJson(Map? json) {
  return json == null ? null : JenkinsBuild.fromJson(json as Map<String, dynamic>);
}
