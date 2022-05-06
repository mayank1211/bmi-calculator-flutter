import 'package:flutter/material.dart';

const double containerMargin = 15.0;
const double containerBorderRadius = 10.0;

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(containerMargin),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(containerBorderRadius),
        ),
        child: this.cardChild,
      ),
    );
  }
}
