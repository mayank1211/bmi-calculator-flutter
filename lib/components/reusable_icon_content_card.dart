import '../theme/constants.dart';
import 'package:flutter/material.dart';

class ReusableIconContentCard extends StatelessWidget {
  ReusableIconContentCard({@required this.genderIcon, this.gender});

  IconData genderIcon;
  String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(genderIcon, size: kIconSize),
        SizedBox(height: kSizedBoxHeight),
        Text('$gender', style: kLabelTextStyle),
      ],
    );
  }
}
