// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';

import 'components/jenkinsapi/api/jenkins_api.dart';
import 'components/jenkinsapi/impl/jenkins_api_impl.dart';
import 'components/navigator/navigator_service.dart';
import 'components/settings/api/settings.dart';
import 'components/settings/impl/settings_impl.dart';

final locator = StackedLocator.instance;

void setupLocator() {
  locator.registerSingleton(NavigatorService());
  locator.registerSingleton<Settings>(SettingsImpl());
  locator.registerLazySingleton<JenkinsApi>(() => JenkinsApiImpl());
}
