import 'package:flutter/services.dart';
import 'package:flutter_starter_app/bloc/example_bloc.dart';
import 'package:flutter_starter_app/utils/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_app/utils/navigation/routes.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:restui/restui.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config.dart';
import 'utils/style_provider/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// App supported orientations init
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then(
    (_) {
      runApp(MyApp());
    },
  );
}

const _appColors = const AppColors(
  accent: Color(0xFF36D7B7),
  secondaryAccent: Color(0xFF6C7A89),
  content: Colors.white,
  secondaryContent: Colors.black,
  background: Colors.white,
  secondaryBackground: Colors.white,
  shadow: Color.fromRGBO(0, 0, 0, 0.1),
  secondaryShadow: Color.fromRGBO(0, 0, 0, 0.05),
);

final Map<int, Color> _primarySwatch = {
  50: _appColors.accent,
  100: _appColors.accent,
  200: _appColors.accent,
  300: _appColors.accent,
  400: _appColors.accent,
  500: _appColors.accent,
  600: _appColors.accent,
  700: _appColors.accent,
  800: _appColors.accent,
  900: _appColors.accent,
};

final _materialColor = MaterialColor(_appColors.accent.value, _primarySwatch);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: RestuiProvider<Api>(
        apiBuilder: (_) => Api(
          uri: Uri.parse(Config.apiUrl),
          link: HeadersMapperLink(["uid", "client", "access-token"])
              .chain(DebugLink(printResponseBody: true)),
        ),
        child: Style(
          child: MaterialApp(
            title: 'Eprufhealth',
            localizationsDelegates: <LocalizationsDelegate<dynamic>>[
              FlutterI18nDelegate(
                  fallbackFile: 'en_US',
                  useCountryCode: true,
                  path: 'assets/i18n'),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            theme: ThemeData(
              primarySwatch: _materialColor,
              accentColor: _appColors.accent,
              appBarTheme: AppBarTheme(color: _appColors.accent),
              backgroundColor: _appColors.background,
              dialogBackgroundColor: _appColors.background,
              scaffoldBackgroundColor: _appColors.background,
            ),
            navigatorObservers: [],
            onGenerateRoute: Routes.generateRoute,
            initialRoute: Routes.game,
          ),
          colors: _appColors,
        ),
      ),
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ExampleBloc>(
          create: (_) => ExampleBloc(),
        ),
      ],
    );
  }
}
