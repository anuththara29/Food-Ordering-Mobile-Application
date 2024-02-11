// ignore_for_file: file_names

class RecipeModel {
  final String recipeId;
  final String recipeImg;
  final String recipeName;
  final List<String> ingredients;
  final String instructions;
  final List<String> nutritions; 
  final dynamic createdAt;
  final dynamic updatedAt;

  RecipeModel({
    required this.recipeId,
    required this.recipeImg,
    required this.recipeName,
    required this.ingredients,
    required this.instructions,
    required this.nutritions, 
    required this.createdAt,
    required this.updatedAt,
  });

  // Serialize the RecipeModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'recipeId': recipeId,
      'recipeImg': recipeImg,
      'recipeName': recipeName,
      'ingredients': ingredients,
      'instructions': instructions,
      'nutritions': nutritions, 
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // Create a RecipeModel instance from a JSON map
  factory RecipeModel.fromMap(Map<String, dynamic> json) {
    return RecipeModel(
      recipeId: json['recipeId'],
      recipeImg: json['recipeImg'],
      recipeName: json['recipeName'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: json['instructions'],
      nutritions: List<String>.from(json['nutritions']), // Changed field name
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}