import 'package:flutter/material.dart';

class ColorsPokemon {
  static const Color primaryColor = Color(0xFFE91E63);
  static const Color primaryColorDark = Color(0xFF77DCB5);
  static const Color primaryColorLight = Color(0xFFD4EE6C);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color primaryTextColor = Color(0xFF212121);
  static const Color secondaryTextColor = Color(0xFF757575);
  static const Color dividerColor = Color(0xFFBDBDBD);
  static const Color backgroundColor = Color(0xFF77DCB5);
  static const Color backgroundGalleryColor = Color(0xFFFFFFFF);

  //Colors for the types of pokemon
  static const Color typeBug = Color(0xFFA8B820);
  static const Color typeDark = Color(0xFF705848);
  static const Color typeDragon = Color(0xFF7038F8);
  static const Color typeElectric = Color(0xFFF8D030);
  static const Color typeFairy = Color(0xFFEE99AC);
  static const Color typeFighting = Color(0xFFC03028);
  static const Color typeFire = Color(0xFFF08030);
  static const Color typeFlying = Color(0xFFA890F0);
  static const Color typeGhost = Color(0xFF705898);
  static const Color typeGrass = Color(0xFF78C850);
  static const Color typeGround = Color(0xFFE0C068);
  static const Color typeIce = Color(0xFF98D8D8);
  static const Color typeNormal = Color(0xFFA8A878);
  static const Color typePoison = Color(0xFFA040A0);
  static const Color typePsychic = Color(0xFFF85888);
  static const Color typeRock = Color(0xFFB8A038);
  static const Color typeSteel = Color(0xFFB8B8D0);
  static const Color typeWater = Color(0xFF6890F0);

  static List<Color> changeColorBackground(String? type) {
    switch (type ?? 'normal') {
      case 'grass':
        {
          return [
            ColorsPokemon.typeGrass,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'fire':
        {
          return [ColorsPokemon.typeFire, ColorsPokemon.backgroundGalleryColor];
        }
      case 'water':
        {
          return [
            ColorsPokemon.typeWater,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'bug':
        {
          return [ColorsPokemon.typeBug, ColorsPokemon.backgroundGalleryColor];
        }
      case 'normal':
        {
          return [
            ColorsPokemon.typeNormal,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'poison':
        {
          return [
            ColorsPokemon.typePoison,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'electric':
        {
          return [
            ColorsPokemon.typeElectric,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'ground':
        {
          return [
            ColorsPokemon.typeGround,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'fairy':
        {
          return [
            ColorsPokemon.typeFairy,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'fighting':
        {
          return [
            ColorsPokemon.typeFighting,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'psychic':
        {
          return [
            ColorsPokemon.typePsychic,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'rock':
        {
          return [ColorsPokemon.typeRock, ColorsPokemon.backgroundGalleryColor];
        }
      case 'ghost':
        {
          return [
            ColorsPokemon.typeGhost,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'ice':
        {
          return [ColorsPokemon.typeIce, ColorsPokemon.backgroundGalleryColor];
        }
      case 'dragon':
        {
          return [
            ColorsPokemon.typeDragon,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'dark':
        {
          return [ColorsPokemon.typeDark, ColorsPokemon.backgroundGalleryColor];
        }
      case 'steel':
        {
          return [
            ColorsPokemon.typeSteel,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      case 'flying':
        {
          return [
            ColorsPokemon.typeFlying,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
      default:
        {
          return [
            ColorsPokemon.backgroundColor,
            ColorsPokemon.backgroundGalleryColor
          ];
        }
    }
  }
}
