// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_import

import 'package:flutter/material.dart';
import 'package:food_ordering_mobile_app/screens/auth-ui/log-in-screen.dart';
import 'package:food_ordering_mobile_app/utils/app-constant.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppConstant.appMainColor,
          title: Text(
            "Welcome to Green Plate",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset('assests/images/welcome-icon.json'),
            ),
            Container(
              margin: EdgeInsets.only(top: 25.0),
              child:Text("Your healthy, tasty journey starts now!",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),),
              
              ),
              SizedBox(
              height: Get.height / 12,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                  color: AppConstant.appScendoryColor,
                  borderRadius: BorderRadius.circular(20.0),

                ),
                
                child: TextButton(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Get.to(() => LogInScreen());
                  },
                ),
              ),
            )
          ],
        )));
  }
}
