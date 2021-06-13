import 'package:flutter/material.dart';

import '../../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../../components/navigator/navigator_service.dart';
import '../../main.locator.dart';
import '../../main.router.dart';

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
