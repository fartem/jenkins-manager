import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<void> navigateTo(
    String routeName, {
    arguments,
  }) async {
    await navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void back() => navigatorKey.currentState?.pop();
}
