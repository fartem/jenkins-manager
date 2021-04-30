import 'dart:convert';

import 'package:http/http.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_api.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_job.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_view.dart';

class JenkinsApiImpl extends JenkinsApi {
  @override
  Future<List<JenkinsView>> fetchJenkinsViewsFrom(String url) async {
    final link = 'http://$url/api/json?pretty=true?tree=views[name]';
    final response = await get(Uri.parse(link));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['views'].map((view) => JenkinsView.fromJson(view));
    }
    return [];
  }

  @override
  Future<List<JenkinsJob>> fetchJenkinsJobsFrom(JenkinsView jenkinsView) async {
    return [];
  }
}
