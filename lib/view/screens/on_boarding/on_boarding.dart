
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../utilities/color.dart';
import '../../widgets/CustomDotControllerOnBoarding.dart';
import '../../widgets/custombotton.dart';
import '../../widgets/customslider.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImplement()) ;
    return GetBuilder<OnBoardingControllerImplement>(
      init:OnBoardingControllerImplement() ,
      builder: (controller) {
        return Scaffold(
            backgroundColor: AppColor.backgroundColor,
            body: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*.98,
                child: const Column(children: [
                  Expanded(
                    flex: 4,
                    child: CustomSliderOnBoarding(),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          CustomDotControllerOnBoarding(),
                          Spacer(flex: 2),
                          CustomButtonOnBoarding()
                        ],
                      ))
                ]),
              ),
            ));
      }
    );
  }
}