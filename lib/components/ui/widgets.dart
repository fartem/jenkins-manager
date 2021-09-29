import 'package:flutter/material.dart';

import '../../extensions/jenkins_build_result_extensions.dart';
import '../jenkinsapi/api/entities/jenkins_build.dart';

class JenkinsBuildResultIcon extends StatelessWidget {
  final JenkinsBuildResult jenkinsBuildResult;

  JenkinsBuildResultIcon({
    required this.jenkinsBuildResult,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      jenkinsBuildResult.icon(),
      size: 36,
      color: jenkinsBuildResult.color(),
    );
  }
}
