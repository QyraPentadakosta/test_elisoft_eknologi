import 'package:flutter/material.dart';

enum RouteType { push, pushReplace, pushRemove }

NavigatorState goBack(BuildContext context) {
  return Navigator.of(context);
}

Future goToWidget(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  var pageRoute = MaterialPageRoute(
    builder: (context) => page,
    settings: RouteSettings(name: "/${page.toString()}", arguments: arguments),
  );
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(
      context,
      pageRoute,
      result: ModalRoute.of(context)?.currentResult,
    );
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      pageRoute,
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    pageRoute,
  );
}

Future goToNamed(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required String routeName,
}) {
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: arguments,
      result: ModalRoute.of(context)?.currentResult,
    );
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
  return Navigator.pushNamed(
    context,
    routeName,
    arguments: arguments,
  );
}
