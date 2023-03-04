import 'package:flutter/material.dart';

class AppColor {
  //maingradient
  Gradient mainGradient =
      const LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft,
          // stops: [
          //   0.2,
          //   0.5,
          //   0.8,
          //   0.7
          // ],
          colors: [
        Color.fromARGB(255, 251, 252, 252),
        Color.fromARGB(255, 234, 243, 249),
        Color.fromARGB(255, 215, 233, 249),
        Color.fromARGB(255, 186, 222, 249)
      ]);

  //maingradient
  Gradient secondGradient = const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      // stops: [
      //   0.2,
      //   0.5,
      //   0.8,
      //   0.7
      // ],
      colors: [
        Color.fromARGB(255, 251, 252, 252),
        Color.fromARGB(255, 234, 243, 249),
        Color.fromARGB(255, 215, 233, 249),
        Color.fromARGB(255, 186, 222, 249)
      ]);

  static final doneColour = Colors.lightGreen.shade400;
  static final doneVerifiedColour = Colors.green.shade700;
  static final pendingColour = Colors.orange.shade700;
  static final declainedColour = Colors.redAccent;
  static final processingColour = Colors.lightBlueAccent;
  static final requestedColour = Colors.purple.shade700;

  //text color
  static final donetextColour = Colors.white;
  static final doneVerifiedtextColour = Colors.white;
  static final pendingtextColour = Colors.white54;
  static final declainedtextColour = Colors.white54;
  static final processingtextColour = Colors.black87;
  static final requestedtextColour = Colors.white54;
}
