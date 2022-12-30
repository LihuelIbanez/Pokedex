import 'dart:async';
import 'package:http/http.dart' as http;

class PokeAPI {
  static const String secondUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  static const String baseUrl = "https://pokeapi.co/api/v2/";
  static Future<http.Response> getPokemons(int numLimit) async =>
      await http.get(Uri.parse("$baseUrl/pokemon?limit=$numLimit"));
  static Future<http.Response> getPokemonStats(int idPokemon) async =>
      await http.get(Uri.parse("$baseUrl/pokemon/$idPokemon"));

  static Future<http.Response> getPokemon2Stats() async =>
      await http.get(Uri.parse(secondUrl));
}
