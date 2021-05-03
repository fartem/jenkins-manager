import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_api.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_job.dart';
import 'package:jenkins_manager/components/settings/api/settings.dart';
import 'package:jenkins_manager/main.locator.dart';
import 'package:stacked/stacked.dart';

class JenkinsJobView extends StatefulWidget {
  final _jenkinsJob;
  final _animationController;

  const JenkinsJobView(
    this._jenkinsJob,
    this._animationController,
  );

  @override
  State<StatefulWidget> createState() => JenkinsJobViewState();
}

class JenkinsJobViewState extends State<JenkinsJobView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkisJobViewViewModel>.reactive(
      viewModelBuilder: () => JenkisJobViewViewModel(
        widget._jenkinsJob,
      ),
      builder: (context, model, widget) {
        return ListTile(
          leading: iconForJenkinsJobAction(
            model.isRunning,
            model.jenkinsJob.jenkinsJobStatus,
          ),
          trailing: Icon(
            Icons.play_circle_fill,
          ),
          title: Text(
            model.jenkinsJob.name,
          ),
          subtitle: Text(
            textForJenkinsJobStatus(
              model.jenkinsJob.jenkinsJobStatus,
            ),
          ),
          onTap: () => model.jobPressed(),
        );
      },
    );
  }

  Widget iconForJenkinsJobAction(
    bool isRunning,
    JenkinsJobStatus jenkinsJobStatus,
  ) {
    if (!isRunning) {
      return iconForJenkinsJobStatus(
        jenkinsJobStatus,
      );
    }
    return RotationTransition(
      turns: Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(widget._animationController),
      child: Icon(
        Icons.sync,
        color: colorForJenkinsJobStatus(
          jenkinsJobStatus,
        ),
      ),
    );
  }

  String textForJenkinsJobStatus(JenkinsJobStatus jenkinsJobStatus) {
    switch (jenkinsJobStatus) {
      case JenkinsJobStatus.aborted:
        return 'Aborted';
      case JenkinsJobStatus.not_build:
        return 'Not build';
      case JenkinsJobStatus.failure:
        return 'Failure';
      case JenkinsJobStatus.unstable:
        return 'Unstable';
      case JenkinsJobStatus.success:
        return 'Success';
    }
  }

  Widget iconForJenkinsJobStatus(JenkinsJobStatus jenkinsJobStatus) {
    var icon = Icons.block;
    switch (jenkinsJobStatus) {
      case JenkinsJobStatus.failure:
      case JenkinsJobStatus.unstable:
        icon = Icons.error;
        break;
      case JenkinsJobStatus.success:
        icon = Icons.check_circle_rounded;
        break;
    }
    return Icon(
      icon,
      color: colorForJenkinsJobStatus(
        jenkinsJobStatus,
      ),
    );
  }

  Color colorForJenkinsJobStatus(JenkinsJobStatus jenkinsJobStatus) {
    switch (jenkinsJobStatus) {
      case JenkinsJobStatus.aborted:
        return Colors.yellow;
      case JenkinsJobStatus.not_build:
        return Colors.grey;
      case JenkinsJobStatus.failure:
      case JenkinsJobStatus.unstable:
        return Colors.red;
      case JenkinsJobStatus.success:
        return Colors.green;
    }
  }
}

class JenkisJobViewViewModel extends ChangeNotifier {
  final _jenkinsApi = locator<JenkinsApi>();
  final _settings = locator<Settings>();

  final JenkinsJob jenkinsJob;

  bool isRunning = false;

  JenkisJobViewViewModel(this.jenkinsJob);

  Future<void> jobPressed() async {
    final result = await _jenkinsApi.runJenkinsJob(
      _settings.jenkinsCredentials(),
      jenkinsJob,
    );
    isRunning = result;
    if (!result) {
      jenkinsJob.jenkinsJobStatus = JenkinsJobStatus.not_build;
    }
    notifyListeners();
  }
}
