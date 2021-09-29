import 'package:json_annotation/json_annotation.dart';

part 'jenkins_build.g.dart';

@JsonSerializable()
class JenkinsBuild {
  final name;
  final building;
  final duration;

  @JsonKey(fromJson: jenkinsBuildStatusFromJson)
  final JenkinsBuildResult result;

  JenkinsBuild({
    required this.name,
    required this.building,
    required this.duration,
    required this.result,
  });

  factory JenkinsBuild.fromJson(Map<String, dynamic> json) => _$JenkinsBuildFromJson(json);
}

JenkinsBuildResult jenkinsBuildStatusFromJson(String? status) {
  if (status == null) {
    return JenkinsBuildResult.running;
  }
  return _jenkinsBuildResultValues[status] ?? JenkinsBuildResult.notBuild;
}

enum JenkinsBuildResult {
  aborted,
  notBuild,
  failure,
  unstable,
  success,
  running,
}

const _jenkinsBuildResultValues = {
  'ABORTED': JenkinsBuildResult.aborted,
  'NOT_BUILD': JenkinsBuildResult.notBuild,
  'FAILURE': JenkinsBuildResult.failure,
  'UNSTABLE': JenkinsBuildResult.unstable,
  'SUCCESS': JenkinsBuildResult.success,
  'RUNNING': JenkinsBuildResult.running,
};
