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

  RangeValues values = RangeValues(0, 5000);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 24, color: Colors.deepPurple),
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
            ),
            SizedBox(
              height: 20,
            ),
            RangeSlider(
                activeColor: Colors.deepPurple,
                inactiveColor: Colors.deepPurple.shade100,
                min: 0,
                divisions: 1000,
                max: 5000,
                labels: labels,
                values: values,
                onChanged: (newValues) {
                  values = newValues;
                  setState(() {});
                })
          ],
        ),
      ),
    );
  }
}
