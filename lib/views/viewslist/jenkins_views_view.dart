import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../components/jenkinsapi/api/jenkins_api.dart';
import '../../components/navigator/navigator_service.dart';
import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';
import '../../main.router.dart';
import 'jenkins_views_view_model.dart';

class JenkinsViewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkinsViewsViewModel>.reactive(
      viewModelBuilder: () => JenkinsViewsViewModel(
        jenkinsApi: locator<JenkinsApi>(),
        settings: locator<Settings>(),
      ),
      builder: (context, model, widget) {
        if (model.isBusy) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final jenkinsView = model.data![index];
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
          itemCount: model.data!.length,
        );
      },
    );
  }
}
