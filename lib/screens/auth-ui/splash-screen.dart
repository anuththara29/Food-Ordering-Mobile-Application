// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_mobile_app/controllers/get-user-data-controller.dart';
import 'package:food_ordering_mobile_app/screens/user-panel/main-screen.dart';
import 'package:food_ordering_mobile_app/utils/app-constant.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'welcome-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), () {
       loggdin(context);
    });
  }
  Future<void> loggdin(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);
        Get.offAll(() => MainScreen());
      
    } else {
      Get.to(() => WelcomeScreen());
    }
  }
  
  @override
  //defines ui structure
  Widget build(BuildContext context) {
    //final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appScendoryColor,
      appBar: AppBar(
      backgroundColor: AppConstant.appScendoryColor,
      elevation: 0,
    ),
    body: Container(child: Column(
      children: [
        Expanded(
          child: Container(
            width: Get.width,
            alignment: Alignment.center,
            child: Lottie.asset('assests/images/splash-icon.json'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          width: Get.width,
          alignment: Alignment.center,
          child: Text(
            AppConstant.appPoweredBy,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold

              ),

        ),
        )
      ],
      ),
      ),
    );
  }
}