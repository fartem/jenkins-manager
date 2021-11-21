import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../components/jenkinsapi/api/entities/jenkins_job.dart';
import '../../components/jenkinsapi/api/jenkins_api.dart';
import '../../components/settings/api/settings.dart';
import '../../main.locator.dart';
import 'jenkins_job_page_view_model.dart';

class JenkinsJobPage extends StatelessWidget {
  final JenkinsJob jenkinsJob;

  const JenkinsJobPage({
    Key? key,
    required this.jenkinsJob,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkinsJobPageViewModel>.reactive(
      viewModelBuilder: () => JenkinsJobPageViewModel(
        jenkinsApi: locator<JenkinsApi>(),
        settings: locator<Settings>(),
        jenkinsJob: jenkinsJob,
      ),
      builder: (context, model, widget) {
        final jenkinsJob = model.jenkinsJob;
        final description = jenkinsJob.description ?? '';
        return Scaffold(
          appBar: AppBar(
            title: Text(jenkinsJob.name),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _JenkinsParameterView(
                title: 'Description',
                parameter: description.isEmpty ? 'No description' : description,
              ),
              _JenkinsParameterView(
                title: 'Health',
                parameter: jenkinsJob.healthReport ?? 'No reports',
              ),
              _JenkinsParameterView(
                title: 'Label',
                parameter: jenkinsJob.labelExpression ?? 'No label',
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text(
                    'Build'.toUpperCase(),
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => model.runJenkinsJob(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _JenkinsParameterView extends StatelessWidget {
  final String title;
  final String parameter;

  const _JenkinsParameterView({
    required this.title,
    required this.parameter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            parameter,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
