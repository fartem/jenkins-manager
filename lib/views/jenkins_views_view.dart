import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../components/jenkinsapi/api/jenkins_api.dart';
import '../components/settings/api/settings.dart';
import '../main.locator.dart';
import 'jenkins_view_view.dart';

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
        return FutureBuilder<List<JenkinsView>>(
          future: model.fetchJenkinsViews(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) => JenkinsViewView(
                snapshot.data![index],
              ),
              itemCount: snapshot.data!.length,
            );
          },
        );
      },
    );
  }
}

class JenkinsViewsViewModel extends ReactiveViewModel {
  final _jenkinsApi = locator<JenkinsApi>();
  final _settings = locator<Settings>();

  Future<List<JenkinsView>> fetchJenkinsViews() async {
    return _jenkinsApi.fetchJenkinsViews(
      _settings.jenkinsCredentials(),
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_settings];
}
