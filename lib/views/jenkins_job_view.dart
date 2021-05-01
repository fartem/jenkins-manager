import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_job.dart';
import 'package:stacked/stacked.dart';

class JenkinsJobView extends StatelessWidget {
  final JenkinsJob _jenkinsJob;

  const JenkinsJobView(this._jenkinsJob);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkisJobViewViewModel>.nonReactive(
      viewModelBuilder: () => JenkisJobViewViewModel(_jenkinsJob),
      builder: (context, model, widget) {
        return ListTile(
          leading: Icon(
            iconForJenkinsJobStatus(
              model.jenkinsJob.jenkinsJobStatus,
            ),
            color: colorForJenkinsJobStatus(
              model.jenkinsJob.jenkinsJobStatus,
            ),
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

  IconData iconForJenkinsJobStatus(JenkinsJobStatus jenkinsJobStatus) {
    switch (jenkinsJobStatus) {
      case JenkinsJobStatus.aborted:
      case JenkinsJobStatus.not_build:
        return Icons.block;
      case JenkinsJobStatus.failure:
      case JenkinsJobStatus.unstable:
        return Icons.error;
      case JenkinsJobStatus.success:
        return Icons.check_circle_rounded;
    }
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
  final JenkinsJob jenkinsJob;

  JenkisJobViewViewModel(this.jenkinsJob);

  void jobPressed() {}
}
