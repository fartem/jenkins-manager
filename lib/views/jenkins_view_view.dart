import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../components/navigator/navigator_service.dart';
import '../main.locator.dart';
import '../main.router.dart';

class JenkinsViewView extends StatelessWidget {
  final JenkinsView jenkinsView;

  const JenkinsViewView(this.jenkinsView);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkinsViewViewViewModel>.reactive(
      viewModelBuilder: () => JenkinsViewViewViewModel(
        jenkinsView,
      ),
      builder: (context, model, widget) {
        return ListTile(
          leading: Icon(
            Icons.folder,
          ),
          title: Text(
            model.jenkinsView.name,
          ),
          subtitle: Text(
            'Jobs: ${model.jenkinsView.jobsCount}',
          ),
          onTap: () => model.jenkinsViewTapped(),
        );
      },
    );
  }
}

class JenkinsViewViewViewModel extends ChangeNotifier {
  final _navigatorService = locator<NavigatorService>();

  final JenkinsView jenkinsView;

  JenkinsViewViewViewModel(this.jenkinsView);

  void jenkinsViewTapped() => _navigatorService.navigateTo(
        Routes.jenkinsViewPage,
        arguments: JenkinsViewPageArguments(
          jenkinsView: jenkinsView,
        ),
      );
}
