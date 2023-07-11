// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngredientStruct extends BaseStruct {
  IngredientStruct({
    String? name,
    bool? isAllergen,
  })  : _name = name,
        _isAllergen = isAllergen;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "isAllergen" field.
  bool? _isAllergen;
  bool get isAllergen => _isAllergen ?? false;
  set isAllergen(bool? val) => _isAllergen = val;
  bool hasIsAllergen() => _isAllergen != null;

  static IngredientStruct fromMap(Map<String, dynamic> data) =>
      IngredientStruct(
        name: data['Name'] as String?,
        isAllergen: data['isAllergen'] as bool?,
      );

  static IngredientStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? IngredientStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'isAllergen': _isAllergen,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'isAllergen': serializeParam(
          _isAllergen,
          ParamType.bool,
        ),
      }.withoutNulls;

  static IngredientStruct fromSerializableMap(Map<String, dynamic> data) =>
      IngredientStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        isAllergen: deserializeParam(
          data['isAllergen'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'IngredientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IngredientStruct &&
        name == other.name &&
        isAllergen == other.isAllergen;
  }

  @override
  int get hashCode => const ListEquality().hash([name, isAllergen]);
}

IngredientStruct createIngredientStruct({
  String? name,
  bool? isAllergen,
}) =>
    IngredientStruct(
      name: name,
      isAllergen: isAllergen,
    );
