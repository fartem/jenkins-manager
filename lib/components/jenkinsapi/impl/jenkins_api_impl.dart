import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_api.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_view.dart';

class JenkinsApiImpl extends JenkinsApi {
  @override
  Future<List<JenkinsView>> fetchJenkinsViewsFrom(
    String url,
    String user,
    String token,
  ) async {
    final link = 'http://$url/api/json?tree=views[name,jobs[name,lastBuild[result]]]';
    final auth = 'Basic ${base64Encode(utf8.encode('$user:$token'))}';
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
      'Cannot fetch views from: $url, statusCode: ${response.statusCode}',
    );
  }
}
