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

// my imports
import 'package:mongo_dart/mongo_dart.dart';
import 'package:nu3_food/custom_code/actions/check_connection.dart';

Future<ProductFromOFFStruct> getProductById(ProductsRecord ean) async {
  await DatabaseManager().openConnection();
  var collection = DatabaseManager().db.collection('products');

  var product =
      await collection.findOne(where.eq('_id', ean.reference.id).fields([
    'ecoscore_data',
    'nutriscore_data',
    'nova_groups_markers',
    'nova_group',
    'nutrient_levels',
    'nova_groups_markers',
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
  var markers = <NovaGroupMarkerStruct>[];

  (product?['nova_groups_markers']).forEach((key, value) {
    var marker = NovaGroupMarkerStruct();
    marker.id = int.tryParse(key);
    var data = <String, NovaGroupMarkerValuesStruct>{};
    for (var name in value) {
      if (data.containsKey(name[0])) {
        data[name[0]]?.values.add(name[1]);
      } else {
        var novaStruct = NovaGroupMarkerValuesStruct();
        novaStruct.name = name[0];
        novaStruct.values = <String>[name[1]];
        data.addAll({name[0]: novaStruct});
      }
    }
    marker.values = data.values.toList();
    markers.add(marker);
  });
  mappedProduct.novaGroupMarkers = markers;
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
