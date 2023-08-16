// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<MedicationStructStruct> getMedicationStruct(
    String name, ProductsRecord product) async {
  final fbInstance = FirebaseFirestore.instance;

  final medication = await fbInstance
      .collection('medication')
      .where("Name", isGreaterThanOrEqualTo: name)
      .get();

  if (medication.docs.length == 0) {
    return MedicationStructStruct(isSafe: false, name: name);
  }

  final medicationItem = medication.docs[0];

  final classifications = medicationItem.get("Classification") as List;

  final classificationsKeys = <String>[];

  for (var item in classifications) {
    if (item is Map<String, dynamic>) {
      var map = Map<String, String>.from(item).values;
      classificationsKeys.addAll(map);
    } else {
      // throw FormatException(
      //     'Unexpected item format'); // or handle it in another way
    }
  }

  if (classificationsKeys.length == 0) {
    return MedicationStructStruct(isSafe: false, name: name);
  }

  final fileteredClassificationKeys =
      getEveryOtherFromList(classificationsKeys, false);

  final businessRules = await fbInstance
      .collection('business_rules')
      .where("name", whereIn: fileteredClassificationKeys)
      .get();

  final allergens = product.allergens;

  final ingredients = product.ingredients;

  final nutritions = product.nutrients;

  for (var businessRule in businessRules.docs) {
    final booleanValues = businessRule.get("boolean_values");

    for (var allergen in allergens) {
      if (booleanValues.containsKey(allergen.toLowerCase()) &&
          booleanValues[allergen] == true) {
        return MedicationStructStruct(isSafe: false, name: name);
      }
    }

    for (var ingredient in ingredients) {
      var ingredientName = ingredient.name.toLowerCase();
      if (booleanValues.containsKey(ingredientName) &&
          booleanValues[ingredientName] == true) {
        return MedicationStructStruct(isSafe: false, name: name);
      }
    }

    final numericalValues = businessRule.get("numerical_values");

    for (var nutrition in nutritions) {
      final unit = nutrition.nutrientType.toLowerCase().replaceFirst(':', '');
      if (numericalValues.containsKey(unit) &&
          numericalValues[unit] <
              double.parse(nutrition.value.replaceAll(",", "."))) {
        return MedicationStructStruct(isSafe: false, name: name);
      }
    }
  }

  return MedicationStructStruct(isSafe: true, name: name);
}
