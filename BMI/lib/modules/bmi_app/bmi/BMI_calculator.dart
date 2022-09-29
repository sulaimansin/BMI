import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_results/BMI_results_screen.dart';







class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({Key? key}) : super(key: key);

  @override
  _BMI_CalculatorState createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {
  bool isMale = true;
  double height =120;
  int weight = 80;
  int age = 20;
  String nameResult = '';
  String suggestion = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: isMale ? Colors.blue :Colors.grey[400] ,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('images/img_1.png'),
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: isMale ? Colors.grey[400] : Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('images/img.png'),
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.grey[400]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  [
                      Text(
                        '${height.round()}',
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text(
                        'CM',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Slider(
                      value: height,
                      min: 80,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                  ),
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: Colors.grey[400]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                         Text(
                          '$weight',
                          style:const  TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w800),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              mini: true,
                              heroTag: 'weight-',
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              mini: true,
                              heroTag: 'weight+',
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: Colors.grey[400]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                         Text(
                          '$age',
                          style:const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w800),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              mini: true,
                              heroTag: 'age-',
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              mini: true,
                              heroTag: 'age+',
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 40.0,
            child: FlatButton(
              onPressed: () {
                var result = weight / pow(height/100, 2);
                if(result < 16){
                  nameResult = 'seriously underweight';
                  suggestion = 'You need to eat a lot';
                } else if(result >=16 && result <18){
                   nameResult = 'under weight';
                   suggestion = 'You need to eat a little bit';
                }else if(result >=18 && result <24){
                  nameResult = 'normal weight';
                  suggestion = 'Keep your body like this';
                }else if(result >=24 && result <29){
                  nameResult = 'over weight';
                  suggestion = 'You need to reduce your weight a little bit';
                }else if(result >=29 && result <35){
                  nameResult = 'seriously overweight';
                  suggestion = 'You need to reduce your weight faster';
                }else if(result >=35 ){
                  nameResult = 'gravely overweight';
                  suggestion = 'You need to reduce your weight you are in danger';
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMI_results_screen(
                      age: age,
                      result: result.round(),
                      gander: isMale,
                      nameResult: nameResult,
                      suggestion: suggestion,
                    ),
                  ),
                );
              },
              child: const Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
