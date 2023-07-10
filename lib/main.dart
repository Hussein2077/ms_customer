import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ms_customer/utilities/app_routes.dart';
import 'package:ms_customer/utilities/color.dart';
import 'package:ms_customer/utilities/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/providers/cart_provider.dart';
import 'controller/providers/wish_provider.dart';
import 'controller/stripe.dart';
import 'firebase_options.dart';
int? isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  Stripe.publishableKey =stripePublishableKey ;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Cart()),
    ChangeNotifierProvider(create: (_) => WishList()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
theme: ThemeData(
  fontFamily: 'Poppins',
  primaryColor: AppColor.primaryColor,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColor.primaryColor
  )
),
      debugShowCheckedModeBanner: false,
      initialRoute:  isViewed != 0 ? AppRoutes.onBoarding : AppRoutes.welcomeScreen,
      // initialRoute: AppRoutes.onBoarding,
      routes: routes
    );
  }
}
