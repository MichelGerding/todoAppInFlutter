import 'package:flutter/material.dart';
import '../styles.dart';

class Buttons {
  static Widget popupButton({Widget child, var callback}) {
    return Container(
      key: UniqueKey(),
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
