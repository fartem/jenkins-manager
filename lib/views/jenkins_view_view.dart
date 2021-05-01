import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_view.dart';
import 'package:stacked/stacked.dart';

class JenkinsViewView extends StatelessWidget {
  final JenkinsView jenkinsView;

  const JenkinsViewView({Key? key, required this.jenkinsView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkinsViewViewViewModel>.reactive(
      viewModelBuilder: () => JenkinsViewViewViewModel(jenkinsView),
      builder: (context, model, widget) {
        return ListTile(
          leading: Icon(
            Icons.folder,
          ),
          title: Text(
            model.jenkinsView.name,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'Jobs: ${model.jenkinsView.jenkinsJobs.length}',
          ),
          onTap: () => model.jenkinsViewTapped(),
        );
      },
    );
  }
}

class JenkinsViewViewViewModel extends ChangeNotifier {
  final JenkinsView jenkinsView;

  JenkinsViewViewViewModel(this.jenkinsView);

  void jenkinsViewTapped() {}
}
