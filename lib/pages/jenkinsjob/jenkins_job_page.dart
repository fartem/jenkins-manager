import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../components/ui/widgets.dart';
import 'jenkins_job_page_view_model.dart';

class JenkinsJobPage extends StatefulWidget {
  final _jenkinsJob;

  const JenkinsJobPage(
    this._jenkinsJob,
  );

  @override
  State<StatefulWidget> createState() => JenkinsJobPageState();
}

class JenkinsJobPageState extends State<JenkinsJobPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JenkinsJobPageViewModel>.reactive(
      viewModelBuilder: () => JenkinsJobPageViewModel(
        widget._jenkinsJob,
      ),
      builder: (context, model, widget) {
        final jenkinsJob = model.jenkinsJob;
        final description = jenkinsJob.description ?? '';
        return Scaffold(
          appBar: AppBar(
            title: Text(
              jenkinsJob.name,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _JenkinsParameterView(
                'Description',
                description.isEmpty ? 'No description' : description,
              ),
              _JenkinsParameterView(
                'Health',
                jenkinsJob.healthReport ?? 'No reports',
              ),
              _JenkinsParameterView(
                'Label',
                jenkinsJob.labelExpression ?? 'No label',
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text(
                    'Build'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () => model.jobPressed(),
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
  final _title;
  final _parameter;

  const _JenkinsParameterView(
    this._title,
    this._parameter,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          FixedSpacer(4),
          Text(
            _parameter,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
