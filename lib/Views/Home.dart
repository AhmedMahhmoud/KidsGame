import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_game/Widgets/LettersWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/736x/12/eb/49/12eb49635b36c803dc8eed3cebb6a24a.jpg"),
                    fit: BoxFit.fill)),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      textDirection: TextDirection.rtl,
                      spacing: 10,
                      children: [
                        LettersWidget(
                          imagePicture: "images/letter1.png",
                          letterName: "أ",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter2.png",
                          letterName: "ب",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter3.png",
                          letterName: "ت",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter4.png",
                          letterName: "ث",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter5.png",
                          letterName: "ج",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter7.png",
                          letterName: "ح",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter6.png",
                          letterName: "خ",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter8.png",
                          letterName: "د",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter9.png",
                          letterName: "ذ",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter10.png",
                          letterName: "ر",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter12.png",
                          letterName: "ز",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter11.png",
                          letterName: "س",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter13.png",
                          letterName: "ش",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter14.png",
                          letterName: "ص",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter15.png",
                          letterName: "ض",
                        ),
                        LettersWidget(
                          imagePicture: "images/ط.png",
                          letterName: "ط",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter16.png",
                          letterName: "ظ",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter17.png",
                          letterName: "ع",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter18.png",
                          letterName: "غ",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter19.png",
                          letterName: "ف",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter20.png",
                          letterName: "ق",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter21.png",
                          letterName: "ك",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter22.png",
                          letterName: "ل",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter23.png",
                          letterName: "م",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter24.png",
                          letterName: "ن",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter25.png",
                          letterName: "ة",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter26.png",
                          letterName: "و",
                        ),
                        LettersWidget(
                          imagePicture: "images/letter27.png",
                          letterName: "ي",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
