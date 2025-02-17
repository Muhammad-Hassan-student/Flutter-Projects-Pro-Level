import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Counter> {
  int counter = 0;

  incrementCounter() {
    setState(() {
      counter++;
    });
  }

  decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 24, color: Colors.amber),
                  text: "Your Counter is",
                  children: [
                    TextSpan(text: " $counter"),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: incrementCounter,
                    child: Center(
                      child: Icon(Icons.add),
                    )),
                ElevatedButton(
                    onPressed: decrementCounter,
                    child: Center(
                      child: Icon(Icons.minimize),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
