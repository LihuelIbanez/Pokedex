import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/utils/routes.dart';
import 'package:pokedex_flutter/core/utils/strings.dart';

void main() => runApp(const PokedexTestApp());

class PokedexTestApp extends StatelessWidget {
  const PokedexTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      translations: Localization(),
      locale: const Locale('es', 'AR'),
      fallbackLocale: const Locale('es'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashScreen',
      getPages: Pages.pages,
    );
  }
}
