import 'package:flutter/material.dart';

class CustomColors {
  static Color background = Color(0xff211e1e);
  static Color buttons2 = Color(0xffd6223d);
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

class Buttons {
  static Widget popupButton({Widget child, var callback}) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: Gradients.buttonGradient,
      ),
      child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: child,
        onPressed: callback(),
      ),
    );
  }
}

class Checkboxes {
  static List<Icon> primary = <Icon>[
    Icon(
      Icons.check_box_outline_blank,
      size: 50,
      color: CustomColors.buttons2,
    ),
    Icon(
      Icons.check_box,
      size: 50,
      color: CustomColors.buttons2,
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
