import 'package:flutter/material.dart';
import 'package:blef/screens/game/game_screen.dart';

class Routes {
  static const game = '/';

  static Route<void> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case game:
        return MaterialPageRoute(builder: (_) => GameScreen());
      default:
        throw Exception("No route defined for \"${settings.name}\"");
    }
  }
}
