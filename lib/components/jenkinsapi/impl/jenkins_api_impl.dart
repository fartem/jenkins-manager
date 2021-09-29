import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../settings/api/settings.dart';
import '../api/entities/jenkins_job.dart';
import '../api/entities/jenkins_view.dart';
import '../api/jenkins_api.dart';

class JenkinsApiImpl extends JenkinsApi {
  @override
  Future<List<JenkinsView>> jenkinsViews({
    required JenkinsCredentials jenkinsCredentials,
  }) async {
    final link = 'http://${jenkinsCredentials.address}/api/json?tree=views[name,jobs]';
    final response = await get(
      Uri.parse(link),
      headers: {
        HttpHeaders.authorizationHeader: _auth(
          jenkinsCredentials.user,
          jenkinsCredentials.token,
        ),
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);
      final result = <JenkinsView>[];
      for (final rawJenkinsView in data['views']) {
        result.add(JenkinsView.fromJson(rawJenkinsView));
      }
      return result;
    }
    throw Exception(
      'Cannot fetch Jenkins views from: ${jenkinsCredentials.address}, statusCode: ${response.statusCode}',
    );
  }

  String _auth(String user, String token) => 'Basic ${base64Encode(utf8.encode('$user:$token'))}';

  @override
  Future<List<JenkinsJob>> jenkinsJobs({
    required JenkinsCredentials jenkinsCredentials,
    required JenkinsView jenkinsView,
  }) async {
    final link =
        'http://${jenkinsCredentials.address}/view/${jenkinsView.name}/api/json?tree=jobs[name,url,description,healthReport[description],labelExpression,lastBuild[building,fullDisplayName,result,duration]]';
    final response = await get(
      Uri.parse(link),
      headers: {
        HttpHeaders.authorizationHeader: _auth(
          jenkinsCredentials.user,
          jenkinsCredentials.token,
        ),
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);
      final result = <JenkinsJob>[];
      for (final rawJenkinsJob in data['jobs']) {
        result.add(JenkinsJob.fromJson(rawJenkinsJob));
      }
      return result;
    }
    throw Exception(
      'Cannot fetch Jenkins jobs from: ${jenkinsCredentials.address}, statusCode: ${response.statusCode}',
    );
  }

  @override
  Future<bool> runJenkinsJob({
    required JenkinsCredentials jenkinsCredentials,
    required JenkinsJob jenkinsJob,
  }) async {
    final link = 'http://${jenkinsCredentials.address}/job/${jenkinsJob.name}/build';
    final response = await post(
      Uri.parse(link),
      headers: {
        HttpHeaders.authorizationHeader: _auth(
          jenkinsCredentials.user,
          jenkinsCredentials.token,
        ),
      },
    );
    return response.statusCode == HttpStatus.created;
  }
}
