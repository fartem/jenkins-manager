import 'package:stacked/stacked.dart';

import '../../components/jenkinsapi/api/entities/jenkins_job.dart';
import '../../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../../components/jenkinsapi/api/jenkins_api.dart';
import '../../components/settings/api/settings.dart';

class JenkinsViewPageViewModel extends FutureViewModel<List<JenkinsJob>> {
  final JenkinsApi jenkinsApi;
  final Settings settings;

  final JenkinsView jenkinsView;

  JenkinsViewPageViewModel({
    required this.jenkinsApi,
    required this.settings,
    required this.jenkinsView,
  });

  @override
  Future<List<JenkinsJob>> futureToRun() => jenkinsApi.jenkinsJobs(
        jenkinsCredentials: settings.jenkinsCredentials(),
        jenkinsView: jenkinsView,
      );
}
