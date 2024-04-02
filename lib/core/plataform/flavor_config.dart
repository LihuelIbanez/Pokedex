enum Enviroment { prod }

class FlavorConfig {
  final String apiUrl;
  final Enviroment enviroment;

  FlavorConfig({required this.apiUrl, required this.enviroment});
}
