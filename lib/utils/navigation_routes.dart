import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test1/features/presentation/views/show_list_view.dart';

import '../features/presentation/views/splash_view.dart';

class Routes {
  static const splashScreen = "splashScreen";
  static const showListScreen = "showListScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return PageTransition(
            child: const SplashScreen(),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: Routes.splashScreen));
      case Routes.showListScreen:
        return PageTransition(
            child: const ShowListView(),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: Routes.showListScreen));
      default:
        return PageTransition(
          child: const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
          type: PageTransitionType.fade,
        );
    }
  }
}
