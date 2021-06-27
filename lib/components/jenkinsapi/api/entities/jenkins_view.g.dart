// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jenkins_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JenkinsView _$JenkinsViewFromJson(Map<String, dynamic> json) {
  return JenkinsView(
    json['name'] as String,
    jenkinsJobsCountFromJson(json['jobs'] as List?),
  );
}

Map<String, dynamic> _$JenkinsViewToJson(JenkinsView instance) =>
    <String, dynamic>{
      'name': instance.name,
      'jobs': instance.jobsCount,
    };
