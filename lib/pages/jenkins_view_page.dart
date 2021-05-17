import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../components/jenkinsapi/api/entities/jenkins_build.dart';
import '../components/jenkinsapi/api/entities/jenkins_job.dart';
import '../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../components/jenkinsapi/api/jenkins_api.dart';
import '../components/navigator/navigator_service.dart';
import '../components/settings/api/settings.dart';
import '../components/ui/widgets.dart';
import '../extensions/jenkins_build_result_extensions.dart';
import '../main.locator.dart';
import '../main.router.dart';

class JenkinsViewPage extends StatefulWidget {
  final JenkinsView _jenkinsView;

  JenkinsViewPage(this._jenkinsView);

  @override
  State<StatefulWidget> createState() => JenkinsViewPageState();
}

class JenkinsViewPageState extends State<JenkinsViewPage> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    )..repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkinsViewPageViewModel>.reactive(
      viewModelBuilder: () => JenkinsViewPageViewModel(
        widget._jenkinsView,
      ),
      builder: (context, model, widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              model.jenkinsView.name,
            ),
          ),
          body: body(model),
        );
      },
    );
  }

  // ignore: avoid-returning-widgets
  Widget body(JenkinsViewPageViewModel model) {
    if (model.isBusy) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final jenkinsJob = model.data![index];
        return _JenkinsJobView(
          jenkinsJob,
          () => model.onJenkinsJobTapped(jenkinsJob),
          _animationController,
        );
      },
      itemCount: model.data!.length,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

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

class _JenkinsJobView extends StatelessWidget {
  final JenkinsJob _jenkinsJob;
  final VoidCallback _jenkinsJobTap;
  final AnimationController _animationController;

  const _JenkinsJobView(
    this._jenkinsJob,
    this._jenkinsJobTap,
    this._animationController,
  );

  @override
  Widget build(BuildContext context) {
    final jenkinsBuildResult = _jenkinsJob.lastBuild?.result ?? JenkinsBuildResult.notBuild;
    return ListTile(
      leading: leadingForJenkinsJob(
        _jenkinsJob.lastBuild,
      ),
      title: Text(
        _jenkinsJob.name,
      ),
      subtitle: Text(
        jenkinsBuildResult.title(),
      ),
      onTap: _jenkinsJobTap,
    );
  }

  // ignore: avoid-returning-widgets
  Widget leadingForJenkinsJob(JenkinsBuild? jenkinsBuild) {
    final jenkinsBuildResult = jenkinsBuild?.result ?? JenkinsBuildResult.notBuild;
    if (jenkinsBuild?.building ?? false) {
      return RotationTransition(
        turns: Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(_animationController),
        child: JenkinsBuildResultIcon(
          jenkinsBuildResult,
        ),
      );
    }
    return JenkinsBuildResultIcon(
      jenkinsBuildResult,
    );
  }
}
