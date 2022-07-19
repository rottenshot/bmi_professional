import 'package:flutter/material.dart';

class TestResult extends StatelessWidget {
  final int age;
  final double finalResult;
  final bool isMale;

  const TestResult(
      {Key? key,
      required this.age,
      required this.isMale,
      required this.finalResult})
      : super(key: key);

  String get resultDescription {
    String result = '';
    // if(finalResult < 18.5 && finalResult <  ) {result = 'Underweight';}

    if (finalResult >= 18.5 && finalResult <= 24.9) {
      result = 'normal';
    } else if (finalResult >= 25 && finalResult <= 29.9) {
      result = 'Overweight';
    } else if (finalResult >= 30) {
      result = 'Obese';
    } else {
      result = 'Underweight';
    }

    return result;
  }

  String get imagePath {
    String path = '';
    // if(finalResult < 18.5 && finalResult <  ) {result = 'Underweight';}

    if (finalResult >= 18.5 && finalResult <= 24.9 && isMale) {
      path = 'assets/images/man_normal.png';
    } else if (finalResult >= 18.5 && finalResult <= 24.9 && !isMale) {
      path = 'assets/images/normal_woman.png';
    } else if (finalResult >= 25 && finalResult <= 29.9 && isMale) {
      path = 'assets/images/man_overweight.png';
    } else if (finalResult >= 25 && finalResult <= 29.9 && !isMale) {
      path = 'assets/images/overweight_woman.png';
    } else if (finalResult >= 30 && isMale) {
      path = 'assets/images/man_obese.png';
    } else if (finalResult >= 30 && !isMale) {
      path = 'assets/images/obese_woman.png';
    } else if (finalResult < 18.5 && isMale) {
      path = 'assets/images/man_underweight.png';
    } else if (finalResult < 18.5 && !isMale) {
      path = 'assets/images/underweight_woman.png';
    }

    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 25,
          color: Colors.grey,
        ),
        centerTitle: true,
        title: const Text('Test Result'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(imagePath),
              ),
              Text(
                'Gender: ${isMale ? 'Male' : 'Female'}',
              ),
              Text('Age: $age'),
              Text(
                'Bmi result:  ${finalResult.toStringAsFixed(1)}',
              ),
              Text('Status: $resultDescription'),
            ],
          ),
        ),
      ),
    );
  }
}
