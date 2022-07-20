import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero/cubit/app_states.dart';
import 'package:zero/views/result_screen.dart';

import '../cubit/app_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = false;
  int weight = 50;
  double heightVal = 160;
  int age = 20;
  double? finalRes;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      builder: (context, state) {
        AppCubit cubit =  AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).themeToggle();},
                  icon: Icon(
                    cubit.isDark==false ? Icons.brightness_4 : Icons.brightness_4_outlined,
                    size: 23,
                  ))
            ],
            title: const Text('BMI Calculator'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: genderDetector(
                              onTap: () {
                                setState(() {
                                  isMale = true;
                                });
                              },
                              genderIcon: Icons.male,
                              genderType: 'Male',
                              color: isMale ? Colors.indigo : Colors.blueGrey),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: genderDetector(
                              onTap: () {
                                setState(() {
                                  isMale = false;
                                });
                              },
                              genderIcon: Icons.female,
                              genderType: 'Female',
                              color: isMale ? Colors.blueGrey : Colors.indigo),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Height'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  heightVal.toStringAsFixed(2),
                                  style: const TextStyle(fontSize: 45),
                                ),
                                const Text(
                                  'CM',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                              inactiveColor: Colors.white,
                              activeColor: Colors.indigo,
                              min: 100,
                              max: 280,
                              onChanged: (val) {
                                setState(() {
                                  heightVal = val;
                                });
                              },
                              value: heightVal,
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Weight',
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 26
                                  ),
                                ),
                                Text(
                                  '$weight',
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 26
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width * .10,
                                      child: FloatingActionButton(
                                        heroTag: '1',
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                          });
                                        },
                                        child: const Icon(Icons.add),
                                      ),
                                    ),
                                    const SizedBox(width: 15,),
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width * .10,
                                      child: FloatingActionButton(
                                        heroTag: '2',
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        },
                                        child: const Icon(Icons.remove),

                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Age',
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 26
                                  ),
                                ),
                                Text(
                                  '$age',
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 23
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width * .10,
                                      child: FloatingActionButton(
                                        heroTag: 3,
                                        onPressed: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                        child: const Icon(Icons.add),
                                      ),
                                    ),
                                    const SizedBox(width: 15,),
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width * .10,
                                      child: FloatingActionButton(
                                        heroTag: '4',
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                          });
                                        },
                                        child: const Icon(Icons.remove),

                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            finalRes=weight/pow(heightVal/100, 2);
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return TestResult(age: age, isMale: isMale, finalResult: finalRes!);
                          }));
                        },
                        child: const Text(
                          'CALCULATE',
                          style: TextStyle(fontSize: 18, fontFamily: 'janna'),
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

Widget genderDetector({
  required onTap,
  required IconData genderIcon,
  required String genderType,
  required Color color,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(genderIcon), Text(genderType)],
      ),
    ),
  );
}
