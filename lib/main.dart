import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_api.dart';
import 'package:jenkins_manager/components/jenkinsapi/impl/jenkins_api_impl.dart';
import 'package:jenkins_manager/components/navigator/navigator_service.dart';
import 'package:jenkins_manager/components/settings/impl/settings_impl.dart';
import 'package:jenkins_manager/main.locator.dart';
import 'package:jenkins_manager/main.router.dart';
import 'package:jenkins_manager/pages/main_page.dart';
import 'package:jenkins_manager/pages/settings_page.dart';
import 'package:stacked/stacked_annotations.dart';

import 'components/settings/api/settings.dart';

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
      page: SettingsPage,
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
