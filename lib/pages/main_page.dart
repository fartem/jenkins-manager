import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jenkins_manager/components/settings/api/settings.dart';
import 'package:jenkins_manager/views/jenkins_views_view.dart';
import 'package:stacked/stacked.dart';

import '../main.dart';

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
  final _settings = GetIt.I.get<Settings>();

  var state = MainPageViewModelState.loading;

  Future<void> init() async {
    await _settings.init();
    state = MainPageViewModelState.loaded;
    notifyListeners();
  }

  void onSettingsPress(BuildContext context) => Navigator.pushNamed(context, pageSettings);
}

enum MainPageViewModelState {
  loading,
  loaded,
}
