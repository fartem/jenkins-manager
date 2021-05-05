import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';

import 'components/jenkinsapi/api/jenkins_api.dart';
import 'components/jenkinsapi/impl/jenkins_api_impl.dart';
import 'components/navigator/navigator_service.dart';
import 'components/settings/api/settings.dart';
import 'components/settings/impl/settings_impl.dart';
import 'main.locator.dart';
import 'main.router.dart';
import 'pages/jenkins_job_page.dart';
import 'pages/jenkins_view_page.dart';
import 'pages/main_page.dart';
import 'pages/settings_page.dart';

const pageSettings = '/settings';

void main() {
  setupLocator();
  runApp(App());
}

@StackedApp(
  routes: [
    MaterialRoute(
      page: MainPage,
      initial: true,
    ),
    MaterialRoute(
      page: JenkinsViewPage,
    ),
    MaterialRoute(
      page: SettingsPage,
    ),
    MaterialRoute(
      page: JenkinsJobPage,
    ),
  ],
  dependencies: [
    Singleton(
      classType: NavigatorService,
    ),
    Singleton(
      classType: SettingsImpl,
      asType: Settings,
    ),
    LazySingleton(
      classType: JenkinsApiImpl,
      asType: JenkinsApi,
    ),
  ],
)
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jenkins Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      navigatorKey: locator<NavigatorService>().navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
