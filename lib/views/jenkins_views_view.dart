import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_api.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_view.dart';
import 'package:jenkins_manager/components/settings/api/settings.dart';
import 'package:jenkins_manager/main.locator.dart';
import 'package:stacked/stacked.dart';

class JenkinsViewsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JenkinsViewsState();
}

class JenkinsViewsState extends State<JenkinsViewsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkinsViewsViewModel>.reactive(
      viewModelBuilder: () => JenkinsViewsViewModel(),
      builder: (context, model, widget) {
        if (model.isBusy) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final hasError = model.hasError;
        if (hasError) {
          return Center(
            child: Text(
              model.error().toString(),
            ),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return Text(
              model.data![index].name,
            );
          },
          itemCount: model.data!.length,
        );
      },
    );
  }
}

class JenkinsViewsViewModel extends FutureViewModel<List<JenkinsView>> {
  final _jenkinsApi = locator<JenkinsApi>();
  final _settings = locator<Settings>();

  @override
  Future<List<JenkinsView>> futureToRun() => _jenkinsApi.fetchJenkinsViewsFrom(_settings.jenkinsAddress());
}
