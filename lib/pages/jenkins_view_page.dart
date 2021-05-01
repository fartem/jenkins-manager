import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_job.dart';
import 'package:jenkins_manager/views/jenkins_job_view.dart';
import 'package:stacked/stacked.dart';

class JenkinsViewPage extends StatelessWidget {
  final List<JenkinsJob> _jenkinsJobs;

  const JenkinsViewPage(this._jenkinsJobs);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkinsViewPageViewModel>.nonReactive(
      viewModelBuilder: () => JenkinsViewPageViewModel(_jenkinsJobs),
      builder: (context, model, widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Jobs',
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) => JenkinsJobView(
              model.jenkinsJobs[index],
            ),
            itemCount: model.jenkinsJobs.length,
          ),
        );
      },
    );
  }
}

class JenkinsViewPageViewModel extends ChangeNotifier {
  final List<JenkinsJob> jenkinsJobs;

  JenkinsViewPageViewModel(this.jenkinsJobs);
}
