import 'package:json_annotation/json_annotation.dart';

part 'jenkins_view.g.dart';

@JsonSerializable()
class JenkinsView {
  final String name;

  @JsonKey(
    name: 'jobs',
    fromJson: jenkinsJobsCountFromJson,
  )
  final int jobsCount;

  JenkinsView(
    this.name,
    this.jobsCount,
  );

  factory JenkinsView.fromJson(Map<String, dynamic> json) => _$JenkinsViewFromJson(json);
}

int jenkinsJobsCountFromJson(List<dynamic>? jenkinsJobs) => jenkinsJobs?.length ?? 0;
