import 'package:blef/state/global_controller.dart';
import 'package:blef/utils/routes.dart';
import 'package:blef/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());

    return GetMaterialApp(
      title: 'Blef',
      initialRoute: Routes.game,
      getPages: Routes.routes(),
      translationsKeys: translation,
      locale: Locale('en', 'US'),
    );
  }
}
