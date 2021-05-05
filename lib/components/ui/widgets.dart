import 'package:flutter/material.dart';

import '../../extensions/jenkins_build_result_extensions.dart';
import '../jenkinsapi/api/entities/jenkins_build.dart';

class FixedSpacer extends StatelessWidget {
  final double _height;

  const FixedSpacer(this._height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }
}

class JenkinsBuildResultIcon extends StatelessWidget {
  final JenkinsBuildResult _jenkinsBuildResult;

  JenkinsBuildResultIcon(this._jenkinsBuildResult);

  @override
  Widget build(BuildContext context) {
    return Icon(
      _jenkinsBuildResult.icon(),
      size: 36,
      color: _jenkinsBuildResult.color(),
    );
  }
}
