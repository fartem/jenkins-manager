import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../components/jenkinsapi/api/entities/jenkins_build.dart';
import '../../components/jenkinsapi/api/entities/jenkins_job.dart';
import '../../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../../components/jenkinsapi/api/jenkins_api.dart';
import '../../components/navigator/navigator_service.dart';
import '../../components/settings/api/settings.dart';
import '../../components/ui/widgets.dart';
import '../../extensions/jenkins_build_result_extensions.dart';
import '../../main.locator.dart';
import '../../main.router.dart';
import 'jenkins_view_page_view_model.dart';

class JenkinsViewPage extends StatefulWidget {
  final JenkinsView jenkinsView;

  JenkinsViewPage({required this.jenkinsView});

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
        jenkinsView: widget.jenkinsView,
        jenkinsApi: locator<JenkinsApi>(),
        settings: locator<Settings>(),
      ),
      builder: (context, model, widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              model.jenkinsView.name,
            ),
          ),
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final jenkinsJob = model.data![index];
                    return _JenkinsJobView(
                      jenkinsJob: jenkinsJob,
                      jenkinsJobTap: () => locator<NavigatorService>().navigateTo(
                        routeName: Routes.jenkinsJobPage,
                        arguments: JenkinsJobPageArguments(
                          jenkinsJob: jenkinsJob,
                        ),
                      ),
                      animationController: _animationController,
                    );
                  },
                  itemCount: model.data!.length,
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _JenkinsJobView extends StatelessWidget {
  final JenkinsJob jenkinsJob;
  final VoidCallback jenkinsJobTap;
  final AnimationController animationController;

  const _JenkinsJobView({
    required this.jenkinsJob,
    required this.jenkinsJobTap,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    final jenkinsBuildResult = jenkinsJob.lastBuild?.result ?? JenkinsBuildResult.notBuild;
    return ListTile(
      leading: leadingForJenkinsJob(
        jenkinsJob.lastBuild,
      ),
      title: Text(jenkinsJob.name),
      subtitle: Text(jenkinsBuildResult.title()),
      onTap: jenkinsJobTap,
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
        ).animate(animationController),
        child: JenkinsBuildResultIcon(
          jenkinsBuildResult: jenkinsBuildResult,
        ),
      );
    }
    return JenkinsBuildResultIcon(
      jenkinsBuildResult: jenkinsBuildResult,
    );
  }
}
