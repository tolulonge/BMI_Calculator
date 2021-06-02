import 'package:flutter/material.dart';
import 'constants.dart';

class IconWidget extends StatelessWidget {
  final String sex;
  final IconData icon;

  IconWidget(this.sex,this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          sex,
          style:
          kLabelTextStyle,
        )
      ],
    );
  }
}
