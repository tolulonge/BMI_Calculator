import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function detectTap;
  ReusableCard({@required this.colour, this.cardChild, this.detectTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: detectTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}