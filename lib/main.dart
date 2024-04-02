import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/core/plataform/flavor_config.dart';
import 'package:pokedex_flutter/core/plataform/http_client.dart';
import 'package:pokedex_flutter/core/use%20cases/main_getx_service.dart';
import 'package:pokedex_flutter/core/utils/routes.dart';
import 'package:pokedex_flutter/core/utils/strings.dart';

void main() {
  final config =
      FlavorConfig(apiUrl: PokeAPI.baseUrl, enviroment: Enviroment.prod);
  maincommon(config);
}

void maincommon(FlavorConfig config) async {
  await MainGetxService().init(config);
  runApp(const PokedexTestApp());
}

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
