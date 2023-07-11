// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubNutritionStruct extends BaseStruct {
  SubNutritionStruct({
    String? name,
    double? value,
    String? unit,
  })  : _name = name,
        _value = value,
        _unit = unit;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "Value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;
  void incrementValue(double amount) => _value = value + amount;
  bool hasValue() => _value != null;

  // "Unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;
  bool hasUnit() => _unit != null;

  static SubNutritionStruct fromMap(Map<String, dynamic> data) =>
      SubNutritionStruct(
        name: data['Name'] as String?,
        value: castToType<double>(data['Value']),
        unit: data['Unit'] as String?,
      );

  static SubNutritionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SubNutritionStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Value': _value,
        'Unit': _unit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Value': serializeParam(
          _value,
          ParamType.double,
        ),
        'Unit': serializeParam(
          _unit,
          ParamType.String,
        ),
      }.withoutNulls;

  static SubNutritionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubNutritionStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['Value'],
          ParamType.double,
          false,
        ),
        unit: deserializeParam(
          data['Unit'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SubNutritionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubNutritionStruct &&
        name == other.name &&
        value == other.value &&
        unit == other.unit;
  }

  @override
  int get hashCode => const ListEquality().hash([name, value, unit]);
}

SubNutritionStruct createSubNutritionStruct({
  String? name,
  double? value,
  String? unit,
}) =>
    SubNutritionStruct(
      name: name,
      value: value,
      unit: unit,
    );
