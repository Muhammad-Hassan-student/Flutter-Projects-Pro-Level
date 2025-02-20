import 'package:flutter/material.dart';

class FooAnimation extends StatefulWidget {
  @override
  State<FooAnimation> createState() {
    return _FooAnimationState();
  }
}

class _FooAnimationState extends State<FooAnimation> {
  var _width;
  var _height;
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 2),
                width: _width,
                height: _height,
                curve: Curves.bounceIn,
                color: Colors.blueAccent,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (flag) {
                        _height = 100.0;
                        _width = 100.0;
                        flag = false;
                      } else {
                        _height = 100.0;
                        _width = 200.0;
                        flag = true;
                      }
                    });
                  },
                  child: Text("Click here"))
            ],
          ),
        ),
      ),
    );
  }
}
