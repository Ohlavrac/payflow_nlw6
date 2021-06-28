import 'package:flutter/material.dart';
import 'package:nlw_together_flutter/shared/themes/app_colors.dart';

class DividerVertialWidget extends StatelessWidget {
  const DividerVertialWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: AppColors.stroke,
    );
  }
}