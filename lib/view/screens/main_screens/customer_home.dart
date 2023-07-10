import 'package:badges/badges.dart'as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_customer/view/screens/main_screens/profile.dart';
import 'package:ms_customer/view/screens/main_screens/stores.dart';
import 'package:provider/provider.dart';

import '../../../controller/nav_bar_customer_controller.dart';
import '../../../controller/providers/cart_provider.dart';
import '../../../utilities/color.dart';
import 'cart.dart';
import 'category.dart';
import 'home.dart';



class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  final List<Widget> tabs = const[
    HomeScreen(),
     CategoryScreen(),
     StoresScreen(),
     CartScreen(),
     ProfileScreen(
      /* documentId: FirebaseAuth.instance.currentUser!.uid, */
    ),
  ];
  @override
  Widget build(BuildContext context) {

    Get.put(CustomerControllerImplement());
    return GetBuilder<CustomerControllerImplement>(
        init:CustomerControllerImplement(),
        builder: (controller)=> Scaffold(
          body: tabs[controller.selectedIndex],
          bottomNavigationBar:BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            selectedItemColor: AppColor.primaryColor,

            currentIndex: controller.selectedIndex,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Category',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: 'Stores',
              ),
              BottomNavigationBarItem(
                icon: badges.Badge(
                    showBadge: context.read<Cart>().getItems.isEmpty ? false : true,
                    badgeStyle: const badges.BadgeStyle(
                      padding: EdgeInsets.all(2),
                      badgeColor: AppColor.primaryColor,

                    ),
                    badgeContent: Text(
                      context.watch<Cart>().getItems.length.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    child: const Icon(Icons.shopping_cart)),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              // setState(() {
              //   _selectedIndex = index;
              // });
              controller.next(index);
            },
          ),
        ));
  }
}
