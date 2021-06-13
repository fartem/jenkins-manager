import 'package:stacked/stacked.dart';

import '../../components/jenkinsapi/api/entities/jenkins_job.dart';
import '../../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../../components/jenkinsapi/api/jenkins_api.dart';
import '../../components/navigator/navigator_service.dart';
import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';
import '../../main.router.dart';

class JenkinsViewPageViewModel extends FutureViewModel<List<JenkinsJob>> {
  final _jenkinsApi = locator<JenkinsApi>();
  final _settings = locator<Settings>();
  final _navigatorService = locator<NavigatorService>();

  final JenkinsView jenkinsView;

  JenkinsViewPageViewModel(this.jenkinsView);

  void onJenkinsJobTapped(JenkinsJob jenkinsJob) => _navigatorService.navigateTo(
        Routes.jenkinsJobPage,
        arguments: JenkinsJobPageArguments(
          jenkinsJob: jenkinsJob,
        ),
      );

  @override
  Future<List<JenkinsJob>> futureToRun() => _jenkinsApi.jenkinsJobs(
        _settings.jenkinsCredentials(),
        jenkinsView,
      );
}
