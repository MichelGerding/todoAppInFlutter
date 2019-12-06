import 'package:flutter/material.dart';

class CustomColors {
  static Color buttons1 = Color(0xffd6224f);
  static Color buttons2 = Color(0xffd6223d);
  //! BackgroundColors
  static Color backgroundPrimairy = Color(0xff121212);
  static Color backgroundSecundairy = Color(0xffd9214f);
}

class Gradients {
  static LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xffd6224f),
      Color(0xffd6223d),
    ],
    begin: FractionalOffset.bottomLeft,
    end: FractionalOffset.topRight,
  );
}

class Checkboxes {
  static List<Icon> primary = <Icon>[
    Icon(
      Icons.check_box_outline_blank,
      size: 50,
      color: Color(0xe5ffffff),
    ),
    Icon(
      Icons.check_box,
      size: 50,
      color: Color(0xe5ffffff),
    ),
  ];
}

class TextStyles {
  static TextStyle header = TextStyle(
    color: Colors.white,
    fontSize: 62,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );
  static TextStyle title = TextStyle(
    fontSize: 26,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
  static TextStyle titleCustom(
      {Color textColor = Colors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
      fontSize: 26,
      color: textColor,
      fontWeight: fontWeight,
      fontFamily: 'Montserrat',
    );
  }

  static TextStyle subTitle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontFamily: 'Montserrat',
  );
  static TextStyle subTitleCustom(
      {Color textColor = Colors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
      fontSize: 16,
      color: textColor,
      fontWeight: fontWeight,
      fontFamily: 'Montserrat',
    );
  }
}
