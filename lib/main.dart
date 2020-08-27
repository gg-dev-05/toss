import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  String coin = "Heads";
  String locationHeads = "assets/heads.png";
  String locationTails = "assets/tails.png";
  String locationFlip = "assets/flip.gif";
  String location = "assets/heads.png";

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFlipping = false;
  String text = "";
  var strings = [
    "You FLIPPED a ",
    "You THREW a ",
    "You GOT a ",
    "You BUMPED on ",
    "The Results : ",
    "This coin got a ",
    "Were you expecting a ",
    "YES ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(57, 61, 72, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('${widget.location}'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$text',
                style: TextStyle(
                    color: Color.fromRGBO(247, 148, 30, 1),
                    fontFamily: 'KaushanScript',
                    fontSize: 28),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Visibility(
              visible: !isFlipping,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 2),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      text = "";
                      isFlipping = true;
                      int vari = Random().nextInt(2);

                      int i = Random().nextInt(strings.length);
                      var before = strings[i % strings.length];
                      print(vari);
                      if (vari == 1) {
                        widget.location = widget.locationFlip;

                        Future.delayed(
                            Duration(seconds: 1 + Random().nextInt(4)), () {
                          setState(() {
                            widget.location = widget.locationTails;
                            text = before;
                            text += "TAILS";
                            isFlipping = false;
                          });
                        });
                      } else {
                        widget.location = widget.locationFlip;

                        Future.delayed(
                            Duration(seconds: 1 + Random().nextInt(4)), () {
                          setState(() {
                            widget.location = widget.locationHeads;
                            text = before;
                            text += "HEADS";
                            isFlipping = false;
                          });
                        });
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      //rgb(247, 148, 30)
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(247, 148, 30, 1),
                        Color.fromRGBO(246, 161, 47, 1)
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                          minWidth: 88.0,
                          minHeight: 36.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        '  FLIP  ',
                        style: TextStyle(fontFamily: 'KaushanScript'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
