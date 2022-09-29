import 'package:flutter/material.dart';


class BMI_results_screen extends StatelessWidget {

  final int age;
  final int result;
  final bool gander;
  final String nameResult;
  final String suggestion;


  const BMI_results_screen({
    required this.age,
    required this.result,
    required this.gander,
    required this.nameResult,
    required this.suggestion,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
                'Gander: ${gander ? 'Male' :'Female'}',
              style:const  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 5,
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Result: $result',
                  style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  ' ($nameResult)',
                  style:const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
            ),
           const Text(
              'Suggestion:',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '($suggestion)',
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Age: $age',
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
