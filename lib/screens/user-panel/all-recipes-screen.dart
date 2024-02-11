// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_mobile_app/models/recipe-model.dart';
import 'package:food_ordering_mobile_app/screens/user-panel/recipe-details-screen.dart';
import 'package:food_ordering_mobile_app/utils/app-constant.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class AllRecipesScreen extends StatefulWidget {
  const AllRecipesScreen({super.key});

  @override
  State<AllRecipesScreen> createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppConstant.appMainColor,
      title: Text(
          "All Recipes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('recipes').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 4,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No recipe found!"),
            );
          }

          if (snapshot.data != null) {
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                childAspectRatio: 1.19,
              ),
              itemBuilder: (context, index) {
                RecipeModel recipeModel = RecipeModel.fromMap(snapshot.data!.docs[index].data() as Map<String, dynamic>);
                return GestureDetector(
                   onTap: ()=> Get.to(() => RecipesDetailScreen(
                            recipeModel: recipeModel)),
                     child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: FillImageCard(
                        borderRadius: 20.0,
                        width: Get.width / 2.3,
                        heightImage: Get.height / 10,
                        imageProvider: CachedNetworkImageProvider(
                          recipeModel.recipeImg,
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              recipeModel.recipeName,
                              style: TextStyle(fontSize: 12.0),
                              
                            ),
                           
                            ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}