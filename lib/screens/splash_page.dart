import 'dart:math';

import 'package:flutter/material.dart';

class UsingAnimationControllerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new UsingAnimationControllerBody(),
    );
  }
}

class UsingAnimationControllerBody extends StatefulWidget {
  @override
  _UsingAnimationControllerBodyState createState() =>
      new _UsingAnimationControllerBodyState();
}

class _UsingAnimationControllerBodyState
    extends State<UsingAnimationControllerBody>
    with SingleTickerProviderStateMixin {
  // static const FACE_LEFT_ANGLE = -pi / 2;
  static const FACE_RIGHT_ANGLE = pi / 2;

  AnimationController _controller;
  Animation _animation;

  double _angle = FACE_RIGHT_ANGLE;

  @override
  void initState() {
    super.initState();

    _controller =
        new AnimationController(duration: new Duration(seconds: 4), vsync: this)
          ..addListener(() {
            this.setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.pushNamed(context, '/home');
            }
          });

    Tween _tween = new AlignmentTween(
      begin: new Alignment(-1.0, 0.0),
      end: new Alignment(1.0, 0.0),
    );

    _animation = _tween.animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new FractionallySizedBox(
            heightFactor: 0.2,
            widthFactor: 0.2,
            alignment: _animation.value,
            child: new Transform.rotate(
              angle: _angle,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: new Icon(
                      Icons.flight,
                      size: 80.0,
                    ),
                  ),
                  Divider(thickness: 2),
                  Expanded(
                    child: Image.asset(
                      'img/logo.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
