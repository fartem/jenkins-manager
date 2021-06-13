import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../components/navigator/navigator_service.dart';
import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';
import '../../main.router.dart';
import '../../views/viewslist/jenkins_views_view.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
      viewModelBuilder: () => MainPageViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, widget) {
        if (model.state != MainPageViewModelState.loaded) {
          return _loader();
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
                onPressed: () => model.onSettingsPress(context),
              ),
            ],
          ),
          body: JenkinsViewsView(),
        );
      },
    );
  }

  // ignore: avoid-returning-widgets
  Widget _loader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class MainPageViewModel extends ChangeNotifier {
  final _settings = locator<Settings>();

  var state = MainPageViewModelState.loading;

  Future<void> init() async {
    await _settings.init();
    state = MainPageViewModelState.loaded;
    notifyListeners();
  }

  void onSettingsPress(BuildContext context) => locator<NavigatorService>().navigateTo(Routes.settingsPage);
}

enum MainPageViewModelState {
  loading,
  loaded,
}
