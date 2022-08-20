import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/CardContent.dart';
import '../components/box.dart';
import '../components/calculation.dart';
import '../constant.dart';
import '../components/RoundIconButton.dart';
import 'Result_Screen.dart';
import '../components/CalcButton.dart';
enum Gender { male, female }

class InputApp extends StatefulWidget {
  const InputApp({super.key});

  @override
  State<InputApp> createState() => _InputAppState();
}

class _InputAppState extends State<InputApp> {
  Gender? selectedGender;
  int height = 178;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Box(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? boxColor : inactive,
                    cardChild: CardContent(
                      icon: FontAwesomeIcons.mars,
                      lable: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: Box(
                    onPress: (() {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    }),
                    colour:
                        selectedGender == Gender.female ? boxColor : inactive,
                    cardChild: CardContent(
                      icon: FontAwesomeIcons.venus,
                      lable: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Box(
            colour: boxColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Height",
                  style: labelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: intStyle),
                    const Text(
                      "cm",
                      style: labelStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 5,
                      overlayColor: const Color(0x29eb1555),
                      thumbColor: const Color(0xffeb1555),
                      activeTrackColor: Colors.white,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 28)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 150,
                      max: 250,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Box(
                  colour: boxColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Weigth",
                        style: labelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: intStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Box(
                  colour: boxColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Age",
                        style: labelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: intStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
           CalButton(onPressed:() {
              Calculate cal = Calculate(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                          bmi: cal.calcBmi(),
                          feed: cal.feed(),
                          category: cal.category())));
            } ,
            child: const Text("Calculate", style: headLine),
          ),
        ],
      ),
    );
  }
}

