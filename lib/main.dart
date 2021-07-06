import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ScaleTransitionExample extends StatefulWidget {
  _ScaleTransitionExampleState createState() => _ScaleTransitionExampleState();
}

class _ScaleTransitionExampleState extends State<ScaleTransitionExample> with TickerProviderStateMixin {

 late AnimationController _controller;
 late Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {

    return Container(
        color: Colors.white,
        child: ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Icon(Icons.check, size: 100.0,color: Colors.green),
                ]
            )
        )
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScaleTransitionExample(),
    );
  }
}

void main() => runApp(MyApp());