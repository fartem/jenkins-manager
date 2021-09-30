import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';
import 'settings_page_view_model.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsPageViewModel>.reactive(
      viewModelBuilder: () => SettingsPageViewModel(
        settings: locator<Settings>(),
      ),
      builder: (context, model, widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
            actions: [
              IconButton(
                icon: Icon(Icons.done),
                onPressed: () => model.setJenkinsCredentials(),
              ),
            ],
          ),
          body: ListView(
            children: [
              _JenkinsPageViewInputField(
                initialValue: model.address,
                hint: 'Address (starts with http/https)',
                onChanged: (newText) => model.address = newText,
              ),
              _JenkinsPageViewInputField(
                initialValue: model.user,
                hint: 'User',
                onChanged: (newText) => model.user = newText,
              ),
              _JenkinsPageViewInputField(
                initialValue: model.token,
                hint: 'Token',
                onChanged: (newText) => model.token = newText,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _JenkinsPageViewInputField extends StatelessWidget {
  final String initialValue;
  final String hint;
  final Function(String newText) onChanged;

  _JenkinsPageViewInputField({
    required this.initialValue,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }
}
