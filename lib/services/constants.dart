import 'package:flutter/material.dart';

class ScreenDimension {
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  EdgeInsets defaultScreenPadding(BuildContext context) => EdgeInsets.fromLTRB(
        15,
        MediaQuery.of(context).padding.top,
        15,
        MediaQuery.of(context).padding.bottom,
      );
}

class AppDecorations {
  Color mainBlueColor = const Color.fromARGB(255, 83, 158, 243);

  InputDecoration inputDecoration1({
    required String fieldLabel,
    required String fieldHelper,
    required IconData fieldIcon,
  }) =>
      InputDecoration(
        labelText: fieldLabel,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(
          height: 1,
          fontSize: 12,
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        hintStyle: const TextStyle(
          height: 1,
          fontSize: 12,
        ),
        helperText: fieldHelper,
        helperMaxLines: 5,
        errorMaxLines: 5,
        helperStyle: const TextStyle(
          height: 1.3,
          fontSize: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
          gapPadding: 5,
        ),
        prefixIcon: Icon(
          fieldIcon,
          size: 15,
        ),
      );
}
