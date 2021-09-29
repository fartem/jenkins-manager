import 'package:stacked/stacked.dart';

import '../../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../../components/jenkinsapi/api/jenkins_api.dart';
import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';

class JenkinsViewsViewModel extends ReactiveViewModel {
  final _jenkinsApi = locator<JenkinsApi>();
  final _settings = locator<Settings>();

  Future<List<JenkinsView>> fetchJenkinsViews() async {
    return _jenkinsApi.jenkinsViews(
      jenkinsCredentials: _settings.jenkinsCredentials(),
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_settings];
}
