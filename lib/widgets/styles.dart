import 'package:flutter/material.dart';
import 'package:sports_db/config/colors.dart';

class TfDecoration {
  static InputDecoration inputDecoration({required String textHint}) {
    return InputDecoration(
      isDense: true,
      focusColor: searchBarColor,
      filled: true,
      fillColor: searchBarColor,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: searchBarColor),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: searchBarColor, width: 0.0),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: searchBarColor),
        borderRadius: BorderRadius.circular(5.0),
      ),
      hintText: textHint,
    );
  }
}
