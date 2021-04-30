import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jenkins_manager/components/settings/api/settings.dart';
import 'package:stacked/stacked.dart';

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
              TextFormField(
                initialValue: model.jenkinsAddress(),
                onChanged: (newText) => model.setJenkinsAddress(newText),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SettingsPageViewModel extends ChangeNotifier {
  final Settings _settings = GetIt.I.get<Settings>();

  String jenkinsAddress() => _settings.jenkinsAddress();

  Future<void> setJenkinsAddress(String jenkinsAddress) => _settings.setJenkinsAddress(jenkinsAddress);
}
