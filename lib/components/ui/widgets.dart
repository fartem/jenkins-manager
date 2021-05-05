import 'package:flutter/material.dart';

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
