// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jenkins_build.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JenkinsBuild _$JenkinsBuildFromJson(Map<String, dynamic> json) {
  return JenkinsBuild(
    name: json['name'],
    building: json['building'],
    duration: json['duration'],
    result: jenkinsBuildStatusFromJson(json['result'] as String?),
  );
}

Map<String, dynamic> _$JenkinsBuildToJson(JenkinsBuild instance) => <String, dynamic>{
      'name': instance.name,
      'building': instance.building,
      'duration': instance.duration,
      'result': _$JenkinsBuildResultEnumMap[instance.result],
    };

const _$JenkinsBuildResultEnumMap = {
  JenkinsBuildResult.aborted: 'aborted',
  JenkinsBuildResult.notBuild: 'notBuild',
  JenkinsBuildResult.failure: 'failure',
  JenkinsBuildResult.unstable: 'unstable',
  JenkinsBuildResult.success: 'success',
  JenkinsBuildResult.running: 'running',
};
