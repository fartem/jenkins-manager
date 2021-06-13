import 'package:flutter/material.dart';

import '../../components/jenkinsapi/api/entities/jenkins_job.dart';
import '../../components/jenkinsapi/api/jenkins_api.dart';
import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';

class JenkinsJobPageViewModel extends ChangeNotifier {
  final _jenkinsApi = locator<JenkinsApi>();
  final _settings = locator<Settings>();

  final JenkinsJob jenkinsJob;

  JenkinsJobPageViewModel(this.jenkinsJob);

  Future<void> jobPressed() async {
    await _jenkinsApi.runJenkinsJob(
      _settings.jenkinsCredentials(),
      jenkinsJob,
    );
    notifyListeners();
  }
}
