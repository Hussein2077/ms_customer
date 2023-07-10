import 'package:flutter/material.dart';

import '../../utilities/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.label, this.onTap}) : super(key: key);
final String label;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 43,
        width: 282,
        decoration:  BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(16),

        ),
        child: Center(
          child: Text(label,
            style: const TextStyle(
            fontSize: 16,
            color: AppColor.backgroundColor,
            fontWeight: FontWeight.w600,
          ),),
        ),
      ),
    );
  }
}
