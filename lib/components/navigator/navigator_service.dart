import 'package:flutter/cupertino.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<void> navigateTo(String routeName) async {
    await navigatorKey.currentState?.pushNamed(routeName);
  }
}
