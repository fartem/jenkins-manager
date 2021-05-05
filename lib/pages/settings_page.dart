import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../components/navigator/navigator_service.dart';
import '../components/settings/api/settings.dart';
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
      builder: (context, model, widget) {
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
              _JenkinsPageViewInputField(
                model.address,
                'Address (starts with http/https)',
                (newText) => model.address = newText,
              ),
              _JenkinsPageViewInputField(
                model.user,
                'User',
                (newText) => model.user = newText,
              ),
              _JenkinsPageViewInputField(
                model.token,
                'Token',
                (newText) => model.token = newText,
              ),
            ],
          ),
        );
      },
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

class _JenkinsPageViewInputField extends StatelessWidget {
  final String _initialValue;
  final String _hint;
  final Function(String newText) _onChanged;

  _JenkinsPageViewInputField(
    this._initialValue,
    this._hint,
    this._onChanged,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        initialValue: _initialValue,
        onChanged: _onChanged,
        decoration: InputDecoration(
          hintText: _hint,
        ),
      ),
    );
  }
}
