import 'package:flutter/material.dart';
import 'package:ms_customer/view/screens/galleries/accessories_gallery.dart';
import 'package:ms_customer/view/screens/galleries/bags_gallery.dart';
import 'package:ms_customer/view/screens/galleries/beauty_gallery.dart';
import 'package:ms_customer/view/screens/galleries/electronics_gallery.dart';
import 'package:ms_customer/view/screens/galleries/homegarden_gallery.dart';
import 'package:ms_customer/view/screens/galleries/kids_gallery.dart';
import 'package:ms_customer/view/screens/galleries/men_gallery.dart';
import 'package:ms_customer/view/screens/galleries/shoes_gallery.dart';
import 'package:ms_customer/view/screens/galleries/women_gallery.dart';
import 'package:ms_customer/view/widgets/fake_search.dart';

import 'package:ms_customer/utilities//color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade100.withOpacity(0.5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const FakeSearch(),
centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor:   AppColor.primaryColor,
            indicatorWeight: 8,
            tabs: [
              RepeatedTab(label: 'Men'),
              RepeatedTab(label: 'Women'),
              RepeatedTab(label: 'Shoes'),
              RepeatedTab(label: 'Bags'),
              RepeatedTab(label: 'Electronics'),
              RepeatedTab(label: 'Accessories'),
              RepeatedTab(label: 'Home & Garden'),
              RepeatedTab(label: 'Kids'),
              RepeatedTab(label: 'Beauty'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MenGalleryScreen(),
            WomenGalleryScreen(),
            ShoesGalleryScreen(),
            BagsGalleryScreen(),
            ElectronicsGalleryScreen(),
            AccessoriesGalleryScreen(),
            HomeGardenGalleryScreen(),
            KidsGalleryScreen(),
            BeautyGalleryScreen()
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
