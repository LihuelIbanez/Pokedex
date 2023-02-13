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
}
