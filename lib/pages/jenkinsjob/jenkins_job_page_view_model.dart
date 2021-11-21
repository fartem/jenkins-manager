import 'package:flutter/material.dart';

import '../../components/jenkinsapi/api/entities/jenkins_job.dart';
import '../../components/jenkinsapi/api/jenkins_api.dart';
import '../../components/settings/api/settings.dart';

class JenkinsJobPageViewModel extends ChangeNotifier {
  final JenkinsApi jenkinsApi;
  final Settings settings;

  final JenkinsJob jenkinsJob;

  JenkinsJobPageViewModel({
    required this.jenkinsApi,
    required this.settings,
    required this.jenkinsJob,
  });

  Future<void> runJenkinsJob() async {
    await jenkinsApi.runJenkinsJob(
      jenkinsCredentials: settings.jenkinsCredentials(),
      jenkinsJob: jenkinsJob,
    );
    notifyListeners();
  }
}
