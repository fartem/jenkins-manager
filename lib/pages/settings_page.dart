import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/navigator/navigator_service.dart';
import 'package:jenkins_manager/components/settings/api/settings.dart';
import 'package:stacked/stacked.dart';

import '../main.locator.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsPageViewModel>.reactive(
      viewModelBuilder: () => SettingsPageViewModel(),
      builder: (context, model, Widget? widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Settings',
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.done,
                ),
                onPressed: () => model.setJenkinsCredentials(),
              ),
            ],
          ),
          body: ListView(
            children: [
              _inputField(
                model.address,
                (newText) => model.address = newText,
              ),
              _inputField(
                model.user,
                (newText) => model.user = newText,
              ),
              _inputField(
                model.token,
                (newText) => model.token = newText,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _inputField(
    String initialValue,
    Function(String newText) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
      ),
    );
  }
}

class SettingsPageViewModel extends ReactiveViewModel {
  final NavigatorService _navigatorService = locator<NavigatorService>();
  final Settings _settings = locator<Settings>();

  late String address;
  late String user;
  late String token;

  SettingsPageViewModel() {
    final jenkinsCredentials = _settings.jenkinsCredentials();
    address = jenkinsCredentials.address;
    user = jenkinsCredentials.user;
    token = jenkinsCredentials.token;
  }

  JenkinsCredentials jenkinsCredentials() => _settings.jenkinsCredentials();

  Future<void> setJenkinsCredentials() async {
    _settings.setJenkinsCredentials(
      JenkinsCredentials(
        address,
        user,
        token,
      ),
    );
    _navigatorService.back();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_settings];
}
