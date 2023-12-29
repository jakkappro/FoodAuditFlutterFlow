// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ProductFromOFFStruct> getProductById(String ean) async {
  await openConnection();
  var collection = db.collection('products');

  var product = await collection.findOne(where.eq('_id', productId).fields([
    'ecoscore_data',
    'nutriscore_data',
    'nova_groups_markers',
    'nova_group',
    'nutrient_levels'
  ]));
  //await closeConnection();  // Not sure here for now i keep it but it might be good idea to keep it open

  var mappedProduct = ProductFromOFFStruct();
  mappedProduct.ecoScore =
      (((product?['ecoscore_data'] ?? <String, dynamic>{})['score'] ?? -1)
              as int)
          .toDouble();
  mappedProduct.ecoScoreGrade = EcoScoreGrades.values.byName(
      (product?['ecoscore_data'] ?? <String, dynamic>{})['grade'] ?? "none");

  mappedProduct.novaGrade = (product?['nova_group'] ?? -1) as int;

  mappedProduct.nutriscoreGrade = EcoScoreGrades.values.byName(
      (product?['nutriscore_data'] ?? <String, dynamic>{})['grade'] ?? "none");
  mappedProduct.nutriscoreFatLevel = NutriscoreLevels.values.byName(
      (product?['nutrient_levels'] ?? <String, dynamic>{})['fat'] ?? "none");
  mappedProduct.nutriscoreSaltLevel = NutriscoreLevels.values.byName(
      (product?['nutrient_levels'] ?? <String, dynamic>{})['salt'] ?? "none");
  mappedProduct.nutriscoreSugarLevel = NutriscoreLevels.values.byName(
      (product?['nutrient_levels'] ?? <String, dynamic>{})['sugars'] ?? "none");
  mappedProduct.nutriscoreSaturatedFatLevel = NutriscoreLevels.values.byName(
      (product?['nutrient_levels'] ?? <String, dynamic>{})['saturated-fat'] ??
          "none");

  return mappedProduct;
}
