import 'package:flutter/cupertino.dart';

class AppColor {

  //maingradient
   Gradient mainGradient = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        0.2,
        0.5,
        0.8,
        0.7
      ],
      colors: [
        Color.fromARGB(255, 227, 242, 253),
        Color.fromARGB(255, 187, 222, 251),
        Color.fromARGB(255, 144, 202, 249),
        Color.fromARGB(255, 100, 181, 246)
      ]);

      //maingradient
   Gradient secondGradient = const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      stops: [
        0.2,
        0.5,
        0.8,
        0.7
      ],
      colors: [
        Color.fromARGB(255, 227, 242, 253),
        Color.fromARGB(255, 187, 222, 251),
        Color.fromARGB(255, 144, 202, 249),
        Color.fromARGB(255, 100, 181, 246)
      ]);

  
      static  final doneColour =  Color(0xFF00796B);
      static  final doneVerifiedColour =  Color(0xFF69F0AE);
      static  final pendingColour =  Color(0xFFFFEB3B);
      static  final  declainedColour =  Color(0xFFFF1744);
      static  final  processingColour =  Color(0xFF03A9F4);
      static  final requestedColour =  Color(0xFFE040FB);


}
