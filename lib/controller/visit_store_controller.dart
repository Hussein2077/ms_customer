
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class VisitStoreController extends GetxController {
  follow(String sId);
}
class VisitStoreControllerImplement extends VisitStoreController{
  bool following = false;

  @override
  follow(String sId) {
    following = !following;
    update();

  }

  openWhatsApp(var whatsapp,BuildContext context) async{
    var whatsAppCode='+20$whatsapp';
    var whatsAppURlAndroid = "whatsapp://send?phone=$whatsAppCode&text=hello";
    if( await canLaunchUrl(Uri.parse(whatsAppURlAndroid))){
      await launchUrl(Uri.parse(whatsAppURlAndroid));
    }else{


      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content:  Text("whatsapp no installed")));

    }



  }


}