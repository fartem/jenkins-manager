// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jenkins_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JenkinsJob _$JenkinsJobFromJson(Map<String, dynamic> json) {
  return JenkinsJob(
    name: json['name'] as String,
    description: json['description'] as String?,
    healthReport: _healthFromJson(json['healthReport'] as List?),
    labelExpression: json['labelExpression'] as String?,
    url: json['url'] as String,
    lastBuild: _jenkinsBuildFromJson(json['lastBuild'] as Map?),
  );
}

Map<String, dynamic> _$JenkinsJobToJson(JenkinsJob instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'healthReport': instance.healthReport,
      'labelExpression': instance.labelExpression,
      'url': instance.url,
      'lastBuild': instance.lastBuild,
    };
