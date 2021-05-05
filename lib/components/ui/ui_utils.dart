import 'package:flutter/material.dart';

import '../jenkinsapi/api/entities/jenkins_build.dart';

String textForJenkinsBuildStatus(JenkinsBuildResult jenkinsBuildStatus) {
  switch (jenkinsBuildStatus) {
    case JenkinsBuildResult.aborted:
      return 'Aborted';
    case JenkinsBuildResult.notBuild:
      return 'Not build';
    case JenkinsBuildResult.failure:
      return 'Failure';
    case JenkinsBuildResult.unstable:
      return 'Unstable';
    case JenkinsBuildResult.success:
      return 'Success';
    case JenkinsBuildResult.running:
      return 'Running';
  }
}

IconData iconForJenkinsBuildStatus(JenkinsBuildResult jenkinsBuildStatus) {
  switch (jenkinsBuildStatus) {
    case JenkinsBuildResult.aborted:
    case JenkinsBuildResult.notBuild:
      return Icons.block;
    case JenkinsBuildResult.failure:
    case JenkinsBuildResult.unstable:
      return Icons.error;
    case JenkinsBuildResult.success:
      return Icons.check_circle_rounded;
    case JenkinsBuildResult.running:
      return Icons.sync;
  }
}

Color colorForJenkinsBuildStatus(JenkinsBuildResult jenkinsBuildStatus) {
  switch (jenkinsBuildStatus) {
    case JenkinsBuildResult.aborted:
      return Colors.yellow;
    case JenkinsBuildResult.notBuild:
      return Colors.grey;
    case JenkinsBuildResult.failure:
    case JenkinsBuildResult.unstable:
      return Colors.red;
    case JenkinsBuildResult.success:
    case JenkinsBuildResult.running:
      return Colors.green;
  }
}
