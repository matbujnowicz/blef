import 'package:blef/screens/game/game_screen.dart';
import 'package:get/route_manager.dart';

class Routes {
  static const String game = "/game";

  static dynamic routes() => [
        GetPage(name: game, page: () => GameScreen()),
      ];
}
