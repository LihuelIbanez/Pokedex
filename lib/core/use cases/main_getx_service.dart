import 'package:get/get.dart';
import 'package:pokedex_flutter/core/plataform/connection_handler.dart';
import 'package:pokedex_flutter/core/plataform/flavor_config.dart';
import 'package:pokedex_flutter/core/plataform/http_client.dart';

class MainGetxService extends GetxService {
  Future<void> init(FlavorConfig config) async {
    final connection = ConnectionHandlerImpl();

    Get.put<FlavorConfig>(config);

    // final prefs = await SharedPreferences.getInstance();
    // Get.put<SharedPreferences>(prefs, permanent: true);
    Get.put<ConnectionHandler>(connection, permanent: true);

    Get.lazyPut<HttpClient>(() => HttpClientImpl(
        config:
            FlavorConfig(apiUrl: config.apiUrl, enviroment: config.enviroment),
        connection: connection));
  }
}
