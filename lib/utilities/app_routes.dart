
import 'package:flutter/material.dart';
import 'package:ms_customer/auth/customer_login.dart';
import 'package:ms_customer/auth/customer_signup.dart';
import 'package:ms_customer/main_screens/customer_home.dart';
import 'package:ms_customer/main_screens/welcome_screen.dart';
import 'package:ms_customer/on_boarding/on_boarding.dart';
import 'package:ms_customer/utilities/routes.dart';
Map<String, Widget Function(BuildContext context)> routes = {
  //auth
  AppRoutes.welcomeScreen:(context)=>const WelcomeScreen(),
  AppRoutes.customerHomeScreen:(context)=> const CustomerHomeScreen(),
  AppRoutes.customerRegister:(context)=>const CustomerRegister(),
  AppRoutes.customerLogin:(context)=>const CustomerLogin(),
  AppRoutes.onBoarding:(context)=>const OnBoarding(),

};
