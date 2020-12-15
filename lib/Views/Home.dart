import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:kids_game/Widgets/test.dart';
import 'package:kids_game/mediaquery/Mediaquery.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static AudioCache player = AudioCache(prefix: "sounds/");
  @override
  void initState() {
    player.play("sunnyday.mp3");

    super.initState();
  }

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
                    image: AssetImage("images/backgroundImage.jpg"),
                    fit: BoxFit.fill)),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: getkDeviceHeightFactor(context, 180),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      textDirection: TextDirection.rtl,
                      spacing: 10,
                      children: mywidget,
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
