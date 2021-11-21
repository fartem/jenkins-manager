import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../components/navigator/navigator_service.dart';
import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';
import '../../main.router.dart';
import '../../views/viewslist/jenkins_views_view.dart';
import 'main_page_view_model.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
      viewModelBuilder: () => MainPageViewModel(
        settings: locator<Settings>(),
      ),
      builder: (context, model, widget) {
        if (model.isBusy) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Jenkins Manager',
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings,
                ),
                onPressed: () => locator<NavigatorService>().navigateTo(
                  routeName: Routes.settingsPage,
                ),
              ),
            ],
          ),
          body: JenkinsViewsView(),
        );
      },
    );
  }
}

enum MainPageViewModelState {
  loading,
  loaded,
}
