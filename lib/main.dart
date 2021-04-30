import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_api.dart';
import 'package:jenkins_manager/components/jenkinsapi/impl/jenkins_api_impl.dart';
import 'package:jenkins_manager/components/settings/impl/settings_impl.dart';
import 'package:jenkins_manager/pages/main_page.dart';
import 'package:jenkins_manager/pages/settings_page.dart';

import 'components/settings/api/settings.dart';

const pageSettings = '/settings';

void main() {
  final getIt = GetIt.I;
  getIt.registerSingleton<JenkinsApi>(JenkinsApiImpl());
  getIt.registerSingleton<Settings>(SettingsImpl());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jenkins Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      routes: {
        pageSettings: (context) => SettingsPage(),
      },
    );
  }
}
