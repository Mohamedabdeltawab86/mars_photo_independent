import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mars_photo_independent/utils/app_router.dart';
import 'package:mars_photo_independent/utils/color_schemes.dart';

import 'ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("settings");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box("settings").listenable(),
        builder: (_, value, __) {
          final bool isDark =
              Hive.box("settings").get('isDark', defaultValue: false);
          final String lang =
              Hive.box("settings").get("lang", defaultValue: 'en');
          return MaterialApp.router(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(lang),
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: lightColorScheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              useMaterial3: true,
            ),
            themeMode: isDark ? ThemeMode.dark: ThemeMode.light,
             debugShowCheckedModeBanner: false,
            routerConfig: router(),
          );
        });
  }
}
