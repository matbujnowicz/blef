import 'package:blef/state/global_controller.dart';
import 'package:blef/utils/routes.dart';
import 'package:blef/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  Get.put(GlobalController());

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blef',
      initialRoute: Routes.game,
      getPages: Routes.routes(),
      translationsKeys: translation,
      locale: Locale('en', 'US'),
    );
  }
}
