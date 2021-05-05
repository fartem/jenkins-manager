import 'package:json_annotation/json_annotation.dart';

part 'jenkins_build.g.dart';

@JsonSerializable()
class JenkinsBuild {
  final name;
  final building;
  final duration;

  @JsonKey(fromJson: jenkinsBuildStatusFromJson)
  final result;

  JenkinsBuild(
    this.name,
    this.building,
    this.duration,
    this.result,
  );

  factory JenkinsBuild.fromJson(Map<String, dynamic> json) => _$JenkinsBuildFromJson(json);
}

JenkinsBuildResult jenkinsBuildStatusFromJson(String? status) {
  if (status == null) {
    return JenkinsBuildResult.running;
  }
  return JenkinsBuildResult.values.firstWhere(
    (s) => _enumValueName(s) == status.toLowerCase(),
    orElse: () => JenkinsBuildResult.notBuild,
  );
}

String _enumValueName(enumValue) {
  final stringRepresentation = enumValue.toString();
  return stringRepresentation.substring(
    stringRepresentation.indexOf('.') + 1,
  );
}

enum JenkinsBuildResult {
  aborted,
  notBuild,
  failure,
  unstable,
  success,
  running,
}
