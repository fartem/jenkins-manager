import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_job.dart';
import 'package:jenkins_manager/views/jenkins_job_view.dart';
import 'package:stacked/stacked.dart';

class JenkinsViewPage extends StatefulWidget {
  final List<JenkinsJob> _jenkinsJobs;

  const JenkinsViewPage(this._jenkinsJobs);

  @override
  State<StatefulWidget> createState() => JenkinsViewPageState();
}

class JenkinsViewPageState extends State<JenkinsViewPage> with TickerProviderStateMixin {
  late AnimationController _animationController;

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
    return ViewModelBuilder<JenkinsViewPageViewModel>.nonReactive(
      viewModelBuilder: () => JenkinsViewPageViewModel(
        widget._jenkinsJobs,
      ),
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
              _animationController,
            ),
            itemCount: model.jenkinsJobs.length,
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

class JenkinsViewPageViewModel extends ChangeNotifier {
  final List<JenkinsJob> jenkinsJobs;

  JenkinsViewPageViewModel(this.jenkinsJobs);
}
