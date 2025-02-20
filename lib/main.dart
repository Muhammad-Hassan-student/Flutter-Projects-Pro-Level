import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/FooAnimation.dart';
import 'package:flutter_projects/pages/SplashScreen.dart';
import 'package:flutter_projects/pages/couter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: ,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Counter(),
      // home: BMI(),
      // home: SplashScreen(),
      home: FooAnimation(),
    );
  }
}

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wtCon = TextEditingController();
  var inchCon = TextEditingController();
  var feetCon = TextEditingController();
  var result;

  var color = LinearGradient(colors: [
    Color(0xffb4eee9),
    Color(0xffd6ead2),
  ], begin: FractionalOffset(1.0, 0.0), end: FractionalOffset(0.0, 1.0));

  double bmi = 0.0;

  calculateBmi() {
    double heightInMeter = 0.0;
    double weight = double.tryParse(wtCon.text) ?? 0.0;

    double feet = double.tryParse(feetCon.text) ?? 0.0;
    double inch = double.tryParse(inchCon.text) ?? 0.0;
    heightInMeter = (feet * 0.3048) + (inch * 0.0254);

    if (heightInMeter > 0 && weight > 0) {
      setState(() {
        bmi = weight / (heightInMeter * heightInMeter);

        print(bmi);
        if (bmi > 25) {
          result = "Over Weight ";
          color = LinearGradient(colors: [
            Color(0xffff5858),
            Color(0xfff09819),
          ]);
        } else if (bmi < 18) {
          result = "Under weight ";
          color = LinearGradient(colors: [
            Color(0xffff0844),
            Color(0xffffb199),
          ]);
        } else {
          result = "You are healthy ";
          color = LinearGradient(colors: [
            Color(0xff43e97b),
            Color(0xff38f9d7),
          ]);
        }
      });
    } else {
      setState(() {
        bmi = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
            backgroundColor: Colors.teal,
            title: Center(
              child: Text(
                "Living Thing Calculator",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Charmonman",
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
          //

          gradient: color,
        ),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: wtCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter your Weight",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: inchCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter your Heignt in (inch)",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: feetCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter your height in (feet)",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          children: [
                        TextSpan(
                          style: TextStyle(
                              // color: color,
                              ),
                          text: result,
                        ),
                        TextSpan(text: "Your BMI is ${bmi.toStringAsFixed(2)}")
                      ])),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: calculateBmi, child: Text("Submit")),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Counter()));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: "Charmonman",
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
