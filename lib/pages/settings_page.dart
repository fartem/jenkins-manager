import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          ),
          body: ListView(
            children: [
              _inputField(
                model.jenkinsAddress(),
                (newText) => model.setJenkinsAddress(newText),
              ),
              _inputField(
                model.jenkinsUser(),
                (newText) => model.setJenkinsUser(newText),
              ),
              _inputField(
                model.jenkinsToken(),
                (newText) => model.setJenkinsToken(newText),
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

class SettingsPageViewModel extends ChangeNotifier {
  final Settings _settings = locator<Settings>();

  String jenkinsAddress() => _settings.jenkinsAddress();

  Future<void> setJenkinsAddress(String jenkinsAddress) => _settings.setJenkinsAddress(jenkinsAddress);

  String jenkinsUser() => _settings.jenkinsUser();

  Future<void> setJenkinsUser(String jenkinsUser) => _settings.setJenkinsUser(jenkinsUser);

  String jenkinsToken() => _settings.jenkinsToken();

  Future<void> setJenkinsToken(String jenkinsToken) => _settings.setJenkinsToken(jenkinsToken);
}
