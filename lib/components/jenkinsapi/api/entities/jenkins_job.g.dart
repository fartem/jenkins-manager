// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jenkins_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JenkinsJob _$JenkinsJobFromJson(Map<String, dynamic> json) {
  return JenkinsJob(
    json['name'] as String,
    json['description'] as String?,
    _healthFromJson(json['healthReport'] as List?),
    json['labelExpression'] as String?,
    json['url'] as String,
    _jenkinsBuildFromJson(json['lastBuild'] as Map?),
  );
}

Map<String, dynamic> _$JenkinsJobToJson(JenkinsJob instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'healthReport': instance.healthReport,
      'labelExpression': instance.labelExpression,
      'url': instance.url,
      'lastBuild': instance.lastBuild,
    };
