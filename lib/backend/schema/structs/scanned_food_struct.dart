// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScannedFoodStruct extends FFFirebaseStruct {
  ScannedFoodStruct({
    String? ean,
    String? nu3Socre,
    String? bin,
    String? nova4,
    List<String>? allergens,
    String? name,
    String? producer,
    List<IngredientStruct>? ingredients,
    List<NutritionStruct>? nutritions,
    String? category,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ean = ean,
        _nu3Socre = nu3Socre,
        _bin = bin,
        _nova4 = nova4,
        _allergens = allergens,
        _name = name,
        _producer = producer,
        _ingredients = ingredients,
        _nutritions = nutritions,
        _category = category,
        super(firestoreUtilData);

  // "EAN" field.
  String? _ean;
  String get ean => _ean ?? '';
  set ean(String? val) => _ean = val;
  bool hasEan() => _ean != null;

  // "Nu3Socre" field.
  String? _nu3Socre;
  String get nu3Socre => _nu3Socre ?? '';
  set nu3Socre(String? val) => _nu3Socre = val;
  bool hasNu3Socre() => _nu3Socre != null;

  // "Bin" field.
  String? _bin;
  String get bin => _bin ?? '';
  set bin(String? val) => _bin = val;
  bool hasBin() => _bin != null;

  // "Nova4" field.
  String? _nova4;
  String get nova4 => _nova4 ?? '';
  set nova4(String? val) => _nova4 = val;
  bool hasNova4() => _nova4 != null;

  // "Allergens" field.
  List<String>? _allergens;
  List<String> get allergens => _allergens ?? const [];
  set allergens(List<String>? val) => _allergens = val;
  void updateAllergens(Function(List<String>) updateFn) =>
      updateFn(_allergens ??= []);
  bool hasAllergens() => _allergens != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "Producer" field.
  String? _producer;
  String get producer => _producer ?? '';
  set producer(String? val) => _producer = val;
  bool hasProducer() => _producer != null;

  // "Ingredients" field.
  List<IngredientStruct>? _ingredients;
  List<IngredientStruct> get ingredients => _ingredients ?? const [];
  set ingredients(List<IngredientStruct>? val) => _ingredients = val;
  void updateIngredients(Function(List<IngredientStruct>) updateFn) =>
      updateFn(_ingredients ??= []);
  bool hasIngredients() => _ingredients != null;

  // "Nutritions" field.
  List<NutritionStruct>? _nutritions;
  List<NutritionStruct> get nutritions => _nutritions ?? const [];
  set nutritions(List<NutritionStruct>? val) => _nutritions = val;
  void updateNutritions(Function(List<NutritionStruct>) updateFn) =>
      updateFn(_nutritions ??= []);
  bool hasNutritions() => _nutritions != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  static ScannedFoodStruct fromMap(Map<String, dynamic> data) =>
      ScannedFoodStruct(
        ean: data['EAN'] as String?,
        nu3Socre: data['Nu3Socre'] as String?,
        bin: data['Bin'] as String?,
        nova4: data['Nova4'] as String?,
        allergens: getDataList(data['Allergens']),
        name: data['Name'] as String?,
        producer: data['Producer'] as String?,
        ingredients: getStructList(
          data['Ingredients'],
          IngredientStruct.fromMap,
        ),
        nutritions: getStructList(
          data['Nutritions'],
          NutritionStruct.fromMap,
        ),
        category: data['Category'] as String?,
      );

  static ScannedFoodStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ScannedFoodStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'EAN': _ean,
        'Nu3Socre': _nu3Socre,
        'Bin': _bin,
        'Nova4': _nova4,
        'Allergens': _allergens,
        'Name': _name,
        'Producer': _producer,
        'Ingredients': _ingredients?.map((e) => e.toMap()).toList(),
        'Nutritions': _nutritions?.map((e) => e.toMap()).toList(),
        'Category': _category,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'EAN': serializeParam(
          _ean,
          ParamType.String,
        ),
        'Nu3Socre': serializeParam(
          _nu3Socre,
          ParamType.String,
        ),
        'Bin': serializeParam(
          _bin,
          ParamType.String,
        ),
        'Nova4': serializeParam(
          _nova4,
          ParamType.String,
        ),
        'Allergens': serializeParam(
          _allergens,
          ParamType.String,
          true,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Producer': serializeParam(
          _producer,
          ParamType.String,
        ),
        'Ingredients': serializeParam(
          _ingredients,
          ParamType.DataStruct,
          true,
        ),
        'Nutritions': serializeParam(
          _nutritions,
          ParamType.DataStruct,
          true,
        ),
        'Category': serializeParam(
          _category,
          ParamType.String,
        ),
      }.withoutNulls;

  static ScannedFoodStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScannedFoodStruct(
        ean: deserializeParam(
          data['EAN'],
          ParamType.String,
          false,
        ),
        nu3Socre: deserializeParam(
          data['Nu3Socre'],
          ParamType.String,
          false,
        ),
        bin: deserializeParam(
          data['Bin'],
          ParamType.String,
          false,
        ),
        nova4: deserializeParam(
          data['Nova4'],
          ParamType.String,
          false,
        ),
        allergens: deserializeParam<String>(
          data['Allergens'],
          ParamType.String,
          true,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        producer: deserializeParam(
          data['Producer'],
          ParamType.String,
          false,
        ),
        ingredients: deserializeStructParam<IngredientStruct>(
          data['Ingredients'],
          ParamType.DataStruct,
          true,
          structBuilder: IngredientStruct.fromSerializableMap,
        ),
        nutritions: deserializeStructParam<NutritionStruct>(
          data['Nutritions'],
          ParamType.DataStruct,
          true,
          structBuilder: NutritionStruct.fromSerializableMap,
        ),
        category: deserializeParam(
          data['Category'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ScannedFoodStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ScannedFoodStruct &&
        ean == other.ean &&
        nu3Socre == other.nu3Socre &&
        bin == other.bin &&
        nova4 == other.nova4 &&
        listEquality.equals(allergens, other.allergens) &&
        name == other.name &&
        producer == other.producer &&
        listEquality.equals(ingredients, other.ingredients) &&
        listEquality.equals(nutritions, other.nutritions) &&
        category == other.category;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ean,
        nu3Socre,
        bin,
        nova4,
        allergens,
        name,
        producer,
        ingredients,
        nutritions,
        category
      ]);
}

ScannedFoodStruct createScannedFoodStruct({
  String? ean,
  String? nu3Socre,
  String? bin,
  String? nova4,
  String? name,
  String? producer,
  String? category,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScannedFoodStruct(
      ean: ean,
      nu3Socre: nu3Socre,
      bin: bin,
      nova4: nova4,
      name: name,
      producer: producer,
      category: category,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScannedFoodStruct? updateScannedFoodStruct(
  ScannedFoodStruct? scannedFood, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    scannedFood
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScannedFoodStructData(
  Map<String, dynamic> firestoreData,
  ScannedFoodStruct? scannedFood,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (scannedFood == null) {
    return;
  }
  if (scannedFood.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && scannedFood.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scannedFoodData =
      getScannedFoodFirestoreData(scannedFood, forFieldValue);
  final nestedData =
      scannedFoodData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = scannedFood.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScannedFoodFirestoreData(
  ScannedFoodStruct? scannedFood, [
  bool forFieldValue = false,
]) {
  if (scannedFood == null) {
    return {};
  }
  final firestoreData = mapToFirestore(scannedFood.toMap());

  // Add any Firestore field values
  scannedFood.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScannedFoodListFirestoreData(
  List<ScannedFoodStruct>? scannedFoods,
) =>
    scannedFoods?.map((e) => getScannedFoodFirestoreData(e, true)).toList() ??
    [];
