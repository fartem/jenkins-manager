import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_api.dart';
import 'package:jenkins_manager/components/jenkinsapi/api/jenkins_view.dart';
import 'package:jenkins_manager/components/settings/api/settings.dart';
import 'package:jenkins_manager/main.locator.dart';
import 'package:jenkins_manager/views/jenkins_view_view.dart';
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
                jenkinsView: snapshot.data![index],
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
    return _jenkinsApi.fetchJenkinsViewsFrom(
      _settings.jenkinsCredentials(),
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_settings];
}
