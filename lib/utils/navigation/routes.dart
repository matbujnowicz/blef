import 'package:flutter/material.dart';
import 'package:flutter_starter_app/screens/game/game_screen.dart';

class Routes {
  static const game = '/game';
  // static const screenName = '/screenName';

  static Route<void> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case game:
        return MaterialPageRoute<void>(builder: (_) => GameScreen());

      // case screenName:
      // return MaterialPageRoute(builder: (_) => MyScreen());
      default:
        throw Exception("No route defined for \"${settings.name}\"");
    }
  }
}
