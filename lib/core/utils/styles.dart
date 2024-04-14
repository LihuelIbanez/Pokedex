import 'package:flutter/material.dart';

class Styles {
  static InputDecoration inputDecorationSearchBar(String hint,
      {required final onTap}) {
    return InputDecoration(
        suffixIcon:
            IconButton(onPressed: onTap, icon: const Icon(Icons.search)),
        border: InputBorder.none,
        focusColor: Colors.yellow,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.yellow, width: 5)),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black, fontSize: 20));
  }

  static InputDecoration inputDecorationVersus(String hint) {
    return InputDecoration(
        border: InputBorder.none,
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.yellow, width: 5)),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black, fontSize: 20));
  }

  static const TextStyle textStyleTitle =
      TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

  static const TextStyle pokemonFontTitleWhite = TextStyle(
    fontFamily: 'Pixel',
    color: Colors.white,
  );
  static const TextStyle pokemonFontTitleBlack = TextStyle(
    fontFamily: 'Pixel',
    color: Colors.black,
  );

  static const TextStyle pokemonNameTitleBlack = TextStyle(
    fontFamily: 'Pixel',
    fontSize: 40,
    color: Colors.black,
  );

  static const TextStyle statNumber = TextStyle(
      fontFamily: 'Pixel',
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 45);

  static const TextStyle statName = TextStyle(
      fontFamily: 'Pixel',
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 43);

  static const TextStyle description = TextStyle(
    fontFamily: 'Pixel',
    fontSize: 15,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle appbarStyle = TextStyle(
    fontFamily: 'Pixel',
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle statOption = TextStyle(
    fontFamily: 'Pixel',
    fontSize: 11,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subTitle = TextStyle(
    fontFamily: 'Pixel',
    fontSize: 19,
    color: Colors.black,
  );
}
