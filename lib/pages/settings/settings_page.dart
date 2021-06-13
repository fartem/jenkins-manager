import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_page_view_model.dart';

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
