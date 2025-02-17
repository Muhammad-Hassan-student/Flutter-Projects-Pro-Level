import 'package:flutter/material.dart';
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
      home: BMI(),
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

  var color = Colors.white;
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
          color = Colors.orange;
        } else if (bmi < 18) {
          result = "Under weight ";
          color = Colors.red;
        } else {
          result = "You are healthy ";
          color = Colors.green;
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
          color: color,
        ),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: wtCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight"),
                  ),
                ),
                TextField(
                  controller: inchCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter your Heignt in (inch)"),
                  ),
                ),
                TextField(
                  controller: feetCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Enter your height in (feet)"),
                  ),
                ),
                Center(
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            backgroundColor: Colors.grey,
                            color: Colors.black,
                          ),
                          children: [
                        TextSpan(
                          style: TextStyle(
                            color: color,
                          ),
                          text: result,
                        ),
                        TextSpan(text: "Your BMI is ${bmi.toStringAsFixed(2)}")
                      ])),
                ),
                ElevatedButton(onPressed: calculateBmi, child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
