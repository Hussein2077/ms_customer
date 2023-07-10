import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ms_customer/utilities/static.dart';
import 'package:ms_customer/utilities/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int i);
}

class OnBoardingControllerImplement extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;

  // final Future<SharedPreferences> _prefs  = SharedPreferences.getInstance();
  // String customerId='';
  @override
  void onInit() async {
    // _prefs.then((SharedPreferences prefs) {
    //   return prefs.getString('customerId') ??'';
    // }).then((String value) {
    //
    //   customerId=value;
    //   nav();
    //
    //   // if(customerId !=''){
    //   //   Get.offAllNamed(AppRoutes.customerHomeScreen);
    //   // }
    //
    // });

    pageController = PageController();
    super.onInit();
  }
  storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  next() async{
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      await storeOnboardInfo();
      Get.offAllNamed(AppRoutes.welcomeScreen);

    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 800),
          curve: Curves.easeInCubic);
    }
  }

  nav() {
    // if(customerId!='') {
    //   Get.offAllNamed(AppRoutes.customerHomeScreen);
  }

  @override
  onPageChanged(int i) {
    currentPage = i;
    update();
  }
}
