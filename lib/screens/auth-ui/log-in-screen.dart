// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:food_ordering_mobile_app/controllers/get-user-data-controller.dart';
import 'package:food_ordering_mobile_app/controllers/log-in-controller.dart';
import 'package:food_ordering_mobile_app/screens/auth-ui/forget-password-screen.dart';
import 'package:food_ordering_mobile_app/screens/auth-ui/sign-up-screen.dart';
import 'package:food_ordering_mobile_app/screens/user-panel/main-screen.dart';
import 'package:food_ordering_mobile_app/utils/app-constant.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final LogInController signInController = Get.put(LogInController());
  final GetUserDataController getUserDataController = Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppConstant.appMainColor,
          centerTitle: true,
          title: Text("Log In",
           style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              isKeyboardVisible? Text(" ",):
              Column(
                children: [
                  Lottie.asset('assests/images/sign-in-icon.json'),
                ],
              ),
              SizedBox(
                height: Get.height / 300,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Unlock the farm-fresh experience, login now!",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(
                height: Get.height / 300,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userEmail,
                    cursorColor: AppConstant.appMainColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(()=>TextFormField(
                    controller: userPassword,
                    obscureText: signInController.isPasswordVisible.value,
                    cursorColor: AppConstant.appMainColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector (
                        onTap: () {
                              signInController.isPasswordVisible.toggle();
                            },
                        child: signInController.isPasswordVisible.value
                           ? Icon(Icons.visibility_off)
                           : Icon(Icons.visibility),
                        ),
                      contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )
                  )
                ),
              ),
              Container(
                 margin: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    color: AppConstant.appMainColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ),
              ),
              SizedBox(
                height: Get.height / 50,
              ),
              Material(
              child: Container(
                width: Get.width / 2,
                height: Get.height / 18,
                decoration: BoxDecoration(
                  color: AppConstant.appScendoryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ), 
                child: TextButton(
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  ),
                  onPressed: ()async {
                    String email = userEmail.text.trim();
                    String password = userPassword.text.trim();

                    if(email.isEmpty || password.isEmpty){
                      Get.snackbar(
                          "Error", "Please enter all details",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appScendoryColor,
                          colorText: Colors.black,
                        );
                    }else{
                      UserCredential? userCredential = await signInController.logInMethod(email, password);
                      var userData = await getUserDataController.getUserData(userCredential!.user!.uid);
                      if(userCredential != null){
                        if(userCredential.user!.emailVerified){
                            Get.offAll(() => MainScreen());
                            Get.snackbar(
                            "Success User Login",
                            "login Successfully!",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryColor,
                            colorText: Colors.black,
                            );                             
                        }else{
                              Get.snackbar(
                                "Error",
                                "Please verify your email before login",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColor,
                                colorText: Colors.black,
                              );
                        }
                      }else {
                          Get.snackbar(
                            "Error",
                            "Please try again",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        }
                    }
                  },
                ),
              ),
            ),
            SizedBox(
                height: Get.height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () => Get.offAll(() => SignUpScreen()),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: AppConstant.appMainColor,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
            ],
          ),
        ),
      );
    });
  }
}
