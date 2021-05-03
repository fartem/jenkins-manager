import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/navigator/navigator_service.dart';
import 'package:jenkins_manager/components/settings/api/settings.dart';
import 'package:jenkins_manager/main.locator.dart';
import 'package:jenkins_manager/main.router.dart';
import 'package:jenkins_manager/views/jenkins_views_view.dart';
import 'package:stacked/stacked.dart';

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
