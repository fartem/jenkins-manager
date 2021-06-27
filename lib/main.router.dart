// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'components/jenkinsapi/api/entities/jenkins_view.dart';
import 'pages/jenkinsjob/jenkins_job_page.dart';
import 'pages/jenkinsview/jenkins_view_page.dart';
import 'pages/main/main_page.dart';
import 'pages/settings/settings_page.dart';

class Routes {
  static const String mainPage = '/';
  static const String jenkinsViewPage = '/jenkins-view-page';
  static const String settingsPage = '/settings-page';
  static const String jenkinsJobPage = '/jenkins-job-page';
  static const all = <String>{
    mainPage,
    jenkinsViewPage,
    settingsPage,
    jenkinsJobPage,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainPage, page: MainPage),
    RouteDef(Routes.jenkinsViewPage, page: JenkinsViewPage),
    RouteDef(Routes.settingsPage, page: SettingsPage),
    RouteDef(Routes.jenkinsJobPage, page: JenkinsJobPage),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainPage(),
        settings: data,
      );
    },
    JenkinsViewPage: (data) {
      var args = data.getArgs<JenkinsViewPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => JenkinsViewPage(args.jenkinsView),
        settings: data,
      );
    },
    SettingsPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsPage(),
        settings: data,
      );
    },
    JenkinsJobPage: (data) {
      var args = data.getArgs<JenkinsJobPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => JenkinsJobPage(args.jenkinsJob),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// JenkinsViewPage arguments holder class
class JenkinsViewPageArguments {
  final JenkinsView jenkinsView;
  JenkinsViewPageArguments({required this.jenkinsView});
}

/// JenkinsJobPage arguments holder class
class JenkinsJobPageArguments {
  final dynamic jenkinsJob;
  JenkinsJobPageArguments({required this.jenkinsJob});
}
