import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  Future<dynamic>? navigateToWithNavKey(
      GlobalKey<NavigatorState> navKey, String routeName,
      {dynamic args}) {
    return navKey.currentState?.pushNamed(routeName, arguments: args);
  }

  Future<dynamic>? navigateToWithContext(BuildContext context, String routeName,
      {dynamic args}) {
    return Navigator.of(context).pushNamed(routeName, arguments: args);
  }

  Future<dynamic>? navigateFinishToWithNavKey(
      GlobalKey<NavigatorState> navKey, String routeName,
      {dynamic args}) {
    return navKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: args);
  }

  Future<dynamic>? navigateFinishToWithContext(
      BuildContext context, String routeName,
      {dynamic args}) {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
  }

  void backWithNavKey(GlobalKey<NavigatorState> navKey) {
    return navKey.currentState?.pop();
  }

  void backWithContext(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<dynamic>? navigateShowDialog(
    BuildContext context,
    Widget child, {
    dynamic args,
    bool dismissible = false,
  }) {
    return showDialog(
      context: context,
      builder: (_) => child,
      barrierDismissible: dismissible,
    );
  }

  Future<dynamic>? navigateShowCupertinoPopup(
    BuildContext context,
    Widget child, {
    dynamic args,
    bool dismissible = false,
  }) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }
}