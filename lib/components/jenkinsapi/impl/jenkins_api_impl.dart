import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_api.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_job.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_view.dart';
import 'package:jenkins_manager/components/settings/api/settings.dart';

class JenkinsApiImpl extends JenkinsApi {
  @override
  Future<List<JenkinsView>> fetchJenkinsViewsFrom(
    JenkinsCredentials jenkinsCredentials,
  ) async {
    final link = 'http://${jenkinsCredentials.address}/api/json?tree=views[name,jobs[name,url,lastBuild[result]]]';
    final auth = 'Basic ${base64Encode(utf8.encode('${jenkinsCredentials.user}:${jenkinsCredentials.token}'))}';
    final response = await get(
      Uri.parse(link),
      headers: {
        HttpHeaders.authorizationHeader: auth,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final result = <JenkinsView>[];
      for (final rawView in data['views']) {
        result.add(JenkinsView.fromJson(rawView));
      }
      return result;
    }
    throw Exception(
      'Cannot fetch views from: ${jenkinsCredentials.address}, statusCode: ${response.statusCode}',
    );
  }

  @override
  Future<bool> runJenkinsJob(
    JenkinsCredentials jenkinsCredentials,
    JenkinsJob jenkinsJob,
  ) async {
    final link = 'http://${jenkinsCredentials.address}/job/${jenkinsJob.name}/build';
    final auth = 'Basic ${base64Encode(utf8.encode('${jenkinsCredentials.user}:${jenkinsCredentials.token}'))}';
    final response = await post(
      Uri.parse(link),
      headers: {
        HttpHeaders.authorizationHeader: auth,
      },
    );
    return response.statusCode == 201;
  }
}
