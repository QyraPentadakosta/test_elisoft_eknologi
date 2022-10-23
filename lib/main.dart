import 'package:flutter/material.dart';
import 'package:test_elisoft_eknologi/routes/routes.dart';

import 'core/theme/i_theme.dart';
import 'routes/route_obs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elifsoft Eknologi',
      theme: ITheme().createTheme(),
      initialRoute: initialRoute,
      onGenerateRoute: routes,
      navigatorObservers: [IRouteObserver()],
    );
  }
}
