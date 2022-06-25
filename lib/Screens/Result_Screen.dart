import 'package:flutter/material.dart';
import '../constant.dart';
import '../components/box.dart';
import '../components/CalcButton.dart';

class Result extends StatelessWidget {
  Result({required this.bmi, required this.category, required this.feed});
  String bmi;
  String category;
  String feed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            throw (' ');
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Center(
                      child: Text("Your Result", style: headLine),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Box(
                      colour: boxColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 30,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              bmi,
                              style: intStyle,
                            ),
                          ),
                          Center(
                            child: Text(
                              feed,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CalButton(child: const Text("Re-Calculate", style: headLine), onPressed: ()=> Navigator.pop(context)),
                
              ],
            ),
          )),
    );
  }
}
