import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_widget.dart';
import 'constants.dart';
import 'buttom_button.dart';



enum Gender{
  Male,
  Female
}

enum IconClicked{
  Minus,
  Plus
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  Gender gender;

  int weight = 60;
  int age = 20;

  void updateWeight(IconClicked iconClicked){
    setState(() {
      iconClicked == IconClicked.Minus ? weight-- : weight++;
    });
  }
  void updateAge(IconClicked iconClicked){
    setState(() {
      iconClicked == IconClicked.Minus ? age-- : age++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    detectTap: (){
                      setState(() {
                        gender = Gender.Male;
                      });
                    },
                    colour: gender == Gender.Male? kReusableCardColor: kInactiveCardColor,
                    cardChild: IconWidget('MALE', FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    detectTap: (){
                          setState(() {
                            gender = Gender.Female;
                          });
                        },
                    cardChild: IconWidget('FEMALE', FontAwesomeIcons.venus),
                    colour: gender == Gender.Female? kReusableCardColor : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kDimensionsTextStyle,),
                      Text('cm', style: kLabelTextStyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0
                      )
                    ),
                    child: Slider(value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kLabelTextStyle,),
                        Text(weight.toString(), style: kDimensionsTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                updateWeight(IconClicked.Minus);
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                updateWeight(IconClicked.Plus);
                              },

                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kLabelTextStyle,),
                        Text(age.toString(), style: kDimensionsTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                updateAge(IconClicked.Minus);
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                updateAge(IconClicked.Plus);
                              },

                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(onTap: (){
            CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          }, buttonTitle: 'CALCULATE',),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
        onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}


