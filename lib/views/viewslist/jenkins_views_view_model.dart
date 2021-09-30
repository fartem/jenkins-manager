import 'package:stacked/stacked.dart';

import '../../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../../components/jenkinsapi/api/jenkins_api.dart';
import '../../components/settings/api/settings.dart';

class JenkinsViewsViewModel extends FutureViewModel<List<JenkinsView>> {
  final JenkinsApi jenkinsApi;
  final Settings settings;

  JenkinsViewsViewModel({
    required this.jenkinsApi,
    required this.settings,
  });

  @override
  Future<List<JenkinsView>> futureToRun() => jenkinsApi.jenkinsViews(
        jenkinsCredentials: settings.jenkinsCredentials(),
      );

  @override
  List<ReactiveServiceMixin> get reactiveServices => [settings];
}
