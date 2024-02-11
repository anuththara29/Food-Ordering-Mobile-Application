// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_mobile_app/screens/user-panel/all-categories-screen.dart';
import 'package:food_ordering_mobile_app/screens/user-panel/all-recipes-screen.dart';
import 'package:food_ordering_mobile_app/screens/user-panel/all-sale-products.dart';
import 'package:food_ordering_mobile_app/screens/user-panel/cart-screen.dart';
import 'package:food_ordering_mobile_app/utils/app-constant.dart';
import 'package:food_ordering_mobile_app/widgets/banner-widget.dart';
import 'package:food_ordering_mobile_app/widgets/category-widget.dart';
import 'package:food_ordering_mobile_app/widgets/custom-drawer-widget.dart';
import 'package:food_ordering_mobile_app/widgets/heading-widget.dart';
import 'package:food_ordering_mobile_app/widgets/recipe-widget.dart';
import 'package:food_ordering_mobile_app/widgets/sale-widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: const Color.fromARGB(255, 150, 209, 173),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppConstant.appMainColor,
        centerTitle: true,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
               //banners
              BannerWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your choice",
                onTap: () => Get.to(()=> AllCategoriesScreen()),
                buttonText: "See More >",
              ),
               CategoriesWidget(),

               Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.0,
              color: AppConstant.appMainColor,
            ),
              
              //heading
              HeadingWidget(
                headingTitle: "20% Off",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(()=> AllSaleProductScreen()),
                buttonText: "See More >",
              ),
              SaleWidget(),

               Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.0,
              color: AppConstant.appMainColor,
            ),

            //heading
              HeadingWidget(
                headingTitle: "Recipes",
                headingSubTitle: "According to your taste",
                onTap: () => Get.to(()=> AllRecipesScreen()),
                buttonText: "See More >",
              ),
              RecipeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
