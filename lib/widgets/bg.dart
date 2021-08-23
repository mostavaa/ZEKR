import 'package:flutter/material.dart';

class BG extends StatefulWidget {
  final Color color;
  BG({this.color});
  @override
  _BGState createState() => _BGState();
}

class _BGState extends State<BG> {
  bool animationStarted = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        animationStarted = true;
      });
    });
    final screenWidth = MediaQuery.of(context).size.width / 100;
    final screenHeight = MediaQuery.of(context).size.height / 100;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final bigBallRadius =
        isLandscape ? (screenWidth * 80) : (screenHeight * 80);
    final smallBallRadius =
        isLandscape ? (screenWidth * 50) : (screenHeight * 50);
    final smallBallPosition =
        isLandscape ? (screenHeight * 25) : (screenWidth * 25);
    final bigBallPosition =
        isLandscape ? (screenHeight * 40) : (screenWidth * 40);

    return Stack(
      children: [
        Container(
          width: screenWidth * 100,
          height: screenHeight * 100,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            // image: DecorationImage(
            //   image: AssetImage("assets/images/star-flakes.png"),
            //   fit: BoxFit.contain,
            // ),
          ),
        ),
        // AnimatedPositioned(
        //   bottom: -bigBallPosition,
        //   right: animationStarted ? -bigBallPosition : (-bigBallPosition + 50),
        //   width: bigBallRadius,
        //   height: bigBallRadius,
        //   duration: Duration(seconds: 1),
        //   child: Container(
        //     decoration: new BoxDecoration(
        //       borderRadius: new BorderRadius.circular(bigBallRadius),
        //       color: Colors.green,
        //     ),
        //   ),
        // ),
        // AnimatedPositioned(
        //   duration: Duration(seconds: 1),
        //   bottom: -smallBallPosition,
        //   right:
        //       animationStarted ? -smallBallPosition : (-smallBallPosition - 50),
        //   width: smallBallRadius,
        //   height: smallBallRadius,
        //   child: Container(
        //     decoration: new BoxDecoration(
        //       borderRadius: new BorderRadius.circular(smallBallRadius),
        //       color: widget.color != null
        //           ? widget.color
        //           : Theme.of(context).primaryColor,
        //     ),
        //   ),
        // ),
        Container(
          width: screenWidth * 100,
          height: screenHeight * 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/star-flakes.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
