import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:kids_game/Widgets/choice.dart';
import 'Test5.dart';

class Test4 extends StatefulWidget {
  final Map<Image, bool> score;
  Test4({this.score});
  @override
  _Test4State createState() => _Test4State();
}

class _Test4State extends State<Test4> {
  int seed = 0;
  int wrong = 0;

  @override
  void initState() {
    //player.play("sunnyday.mp3");
    setState(() {
      seed = Random().nextInt(10);
      print(seed);
    });
    super.initState();
  }

  static AudioCache player = AudioCache(prefix: "sounds/");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Color(0xfff59e5f),
      //   toolbarHeight: 70,
      //   title: Center(
      //       child: Padding(
      //     padding: const EdgeInsets.only(right: 22),
      //     child: Text('Score ${score.length} /27'),
      //   )),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 15),
      //       child: Icon(
      //         Icons.home,
      //         size: 30,
      //       ),
      //     )
      //   ],
      // ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff59e5f),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => Test5(
                        score: widget.score,
                      )));
        },
        child: Icon(Icons.arrow_forward),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          //color: Colors.white,
          //  color: Colors.grey,
          // height: 400,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         colorFilter: new ColorFilter.mode(
          //             Colors.black45.withOpacity(0.9), BlendMode.dstATop),
          //         image: AssetImage('images/testimagee.jpg'),
          //         fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        //
                        // Colors.black45.withOpacity(0.9), BlendMode.dstATop),
                        image: AssetImage('images/testbackground.jpg'),
                        fit: BoxFit.fill)),

                //color: Colors.green,
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      right: 53,
                      top: 37,
                      child: Text(
                        'Score: ${widget.score.length}/27 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
                  ],
                ),
                //child: Image.asset('images/testbackground.jpg'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: choice3.keys
                        .map((answer) => buildDagTarget(answer))
                        .toList()
                          ..shuffle(Random(seed)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //  crossAxisAlignment: CrossAxisAlignment.end,
                    children: choice3.keys.map((letter) {
                      return Draggable<Image>(
                        data: letter,
                        child: Letter(
                            letter: widget.score[letter] == true
                                ? Image.asset("images/correct.jpg")
                                : letter),
                        feedback: Letter(letter: letter),
                        childWhenDragging: Container(
                          color: Colors.red,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDagTarget(letter) {
    return DragTarget<Image>(
      builder: (BuildContext context, List<Image> incoming, List rejected) {
        if (widget.score[letter] == true) {
          return Container(
            margin: EdgeInsets.only(bottom: 5),
            alignment: Alignment.center,
            child: Image.asset(
              'images/bravo.jpg',
              fit: BoxFit.fill,
            ),
            height: 60,
            width: 90,
          );
        } else {
          return Container(
              margin: EdgeInsets.only(bottom: 5),
              child: choice3[letter],
              width: 90,
              height: 60);
        }

        // print(incoming[0]);
      },
      onWillAccept: (data) => data == letter,
      onAccept: (data) {
        setState(() {
          widget.score[letter] = true;
        });
        player.play('correct.mp3');

        print('wwww $wrong');
      },
      onLeave: (data) {
        //  print(data);
      },
      onMove: (data) {
        print(data.toString());
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
        margin: EdgeInsets.only(bottom: 5, left: 10),
        alignment: Alignment.center,
        height: 60,
        width: 90,
        child: Container(
          margin: EdgeInsets.only(bottom: 5, left: 10),
          child: letter,
        ),
      ),
    );
  }
}
