
import 'package:flutter/material.dart';
import 'package:ms_customer/utilities/routes.dart';

import '../view/screens/auth/customer_login.dart';
import '../view/screens/auth/customer_signup.dart';
import '../view/screens/main_screens/customer_home.dart';
import '../view/screens/main_screens/welcome_screen.dart';
import '../view/screens/on_boarding/on_boarding.dart';
Map<String, Widget Function(BuildContext context)> routes = {
  //auth
  AppRoutes.welcomeScreen:(context)=>const WelcomeScreen(),
  AppRoutes.customerHomeScreen:(context)=> const CustomerHomeScreen(),
  AppRoutes.customerRegister:(context)=>const CustomerRegister(),
  AppRoutes.customerLogin:(context)=>const CustomerLogin(),
  AppRoutes.onBoarding:(context)=>const OnBoarding(),

};
