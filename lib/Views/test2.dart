import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  final Map<Image, bool> score;
  Test2({this.score});
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  Map<Image, Image> choice = {
    Image.asset('images/ج.png'): Image.asset('images/letter5.png'),
    Image.asset('images/ح.jpg'): Image.asset('images/letter6.png'),
    Image.asset('images/خ.jpg'): Image.asset('images/letter7.png'),
    Image.asset('images/د.jpg'): Image.asset('images/letter8.png'),
    Image.asset('images/ذ.jpg'): Image.asset('images/letter9.png'),
    Image.asset('images/ر.png'): Image.asset('images/letter10.png'),
    // Image.asset('images/ز.jpg'): Image.asset('images/letter11.png'),
  };
  //Map<Image, bool> score = {};
  int seed = 0;
  AudioCache play = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff59e5f),
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(right: 22),
          child: Center(child: Text('Score ${widget.score.length} /27')),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.home,
              size: 30,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff59e5f),
        onPressed: () {
          setState(() {
            widget.score.clear();
            seed++;
            print(seed);
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Container(
        // color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black45.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage("images/testimage.jpg"),
                fit: BoxFit.fill)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //  crossAxisAlignment: CrossAxisAlignment.end,
              children: choice.keys.map((letter) {
                return Draggable<Image>(
                  data: letter,
                  child: Letter(
                      letter: widget.score[letter] == true
                          ? Image.asset("images/correct.jpg")
                          : letter),
                  feedback: Letter(letter: letter),
                  childWhenDragging: Container(),
                );
              }).toList(),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    choice.keys.map((answer) => buildDagTarget(answer)).toList()
                      ..shuffle(Random(seed))),
          ],
        ),
      ),
    );
  }

  Widget buildDagTarget(letter) {
    return DragTarget<Image>(
      builder: (BuildContext context, List<Image> incoming, List rejected) {
        if (widget.score[letter] == true) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Image.asset('images/bravo.jpg'),
            height: 60,
            width: 50,
          );
        } else {
          return choice[letter];
        }
      },
      onWillAccept: (data) => data == letter,
      onAccept: (data) {
        setState(() {
          widget.score[letter] = true;
        });
        // play.play('audio/');
      },
      onLeave: (data) {
        //  print(data);
      },
    );
  }
}

class Letter extends StatelessWidget {
  final Image letter;
  Letter({this.letter});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: Container(
          child: letter,
        ),
      ),
    );
  }
}
