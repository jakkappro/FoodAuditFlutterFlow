// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ScannedFoodStruct?> getFoodFromEAN(String ean, bool? updateFood) async {
  final scannedItems = FFAppState().ScannedItems;

  if (updateFood != null && updateFood) {
    // get index of food in scanned items with right ean
    final foodIndex = scannedItems.indexWhere((food) => food.ean == ean);

    if (foodIndex != -1) {
      // update foods scannednumber and lasttimescanend
      FFAppState().updateScannedItemsAtIndex(
          foodIndex,
          (food) => ScannedItemStruct(
                ean: food.ean,
                numberOfScans: food.numberOfScans + 1,
                lastScanned: DateTime.now(),
                isFavourite: food.isFavourite,
              ));
    } else {
      FFAppState().addToScannedItems(ScannedItemStruct(
        ean: ean,
        numberOfScans: 1,
        lastScanned: DateTime.now(),
        isFavourite: false,
      ));
    }
  }

  // Add your function code here!
  return ScannedFoodStruct(
    ean: ean,
    nu3Socre: "A",
    bin: "Yellow",
    nova4: "unprocessed",
    allergens: ["gluten", "lactose", "nuts", "soy"],
    name: "Horalka",
    producer: "Horalka",
    ingredients: [
      IngredientStruct(name: "Sugar", isAllergen: false),
      IngredientStruct(name: "Wheat flour", isAllergen: true),
      IngredientStruct(name: "Vegetable fat", isAllergen: false),
      IngredientStruct(name: "Cocoa mass", isAllergen: false),
    ],
    nutritions: [
      NutritionStruct(name: "Energy", units: "kJ", value: 2000),
      NutritionStruct(name: "Energy", units: "kcal", value: 500),
      NutritionStruct(
        name: "Fat",
        units: "g",
        value: 20,
        subNutrition: SubNutritionStruct(
          name: "Saturated fat",
          unit: "g",
          value: 10,
        ),
      ),
    ],
  );
}
