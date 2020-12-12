import 'package:flutter/material.dart';

class Choice {
  Map<Image, Image> choice = {
    Image.asset('images/أ.jpg'): Image.asset('images/letter1.png'),
    Image.asset('images/ب.jpg'): Image.asset('images/letter2.png'),
    Image.asset('images/ت.jpg'): Image.asset('images/letter3.png'),
    Image.asset('images/ث.jpg'): Image.asset('images/letter4.png'),
    Image.asset('images/ج.png'): Image.asset('images/letter5.png'),
    Image.asset('images/ح.jpg'): Image.asset('images/letter6.png'),
    // Image.asset('images/خ.jpg'): Image.asset('images/letter7.png'),
    // Image.asset('images/د.jpg'): Image.asset('images/letter8.png'),
    // Image.asset('images/ذ.jpg'): Image.asset('images/letter9.png'),
    // Image.asset('images/ر.png'): Image.asset('images/letter10.png'),
    // Image.asset('images/ز.jpg'): Image.asset('images/letter11.png'),
  };

  Map<Image, Image> get getchoice1 {
    return choice;
  }

  Map<Image, Image> choice1 = {
    // Image.asset('images/خ.jpg'): Image.asset('images/letter7.png'),
    // Image.asset('images/د.jpg'): Image.asset('images/letter8.png'),
    // Image.asset('images/ذ.jpg'): Image.asset('images/letter9.png'),
    // Image.asset('images/ر.png'): Image.asset('images/letter10.png'),
    // Image.asset('images/ز.jpg'): Image.asset('images/letter11.png'),
  };
}
