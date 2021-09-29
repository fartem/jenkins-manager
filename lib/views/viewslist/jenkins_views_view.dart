import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../components/jenkinsapi/api/entities/jenkins_view.dart';
import '../../components/navigator/navigator_service.dart';
import '../../main.locator.dart';
import '../../main.router.dart';
import 'jenkins_views_view_model.dart';

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
              itemBuilder: (context, index) {
                final jenkinsView = snapshot.data![index];
                return ListTile(
                  leading: Icon(Icons.folder),
                  title: Text(jenkinsView.name),
                  subtitle: Text('Jobs: ${jenkinsView.jobsCount}'),
                  onTap: () => locator<NavigatorService>().navigateTo(
                    routeName: Routes.jenkinsViewPage,
                    arguments: JenkinsViewPageArguments(
                      jenkinsView: jenkinsView,
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          },
        );
      },
    );
  }
}
