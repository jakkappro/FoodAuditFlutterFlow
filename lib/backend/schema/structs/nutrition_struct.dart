// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutritionStruct extends BaseStruct {
  NutritionStruct({
    String? name,
    String? units,
    double? value,
    SubNutritionStruct? subNutrition,
  })  : _name = name,
        _units = units,
        _value = value,
        _subNutrition = subNutrition;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "Units" field.
  String? _units;
  String get units => _units ?? '';
  set units(String? val) => _units = val;
  bool hasUnits() => _units != null;

  // "Value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;
  void incrementValue(double amount) => _value = value + amount;
  bool hasValue() => _value != null;

  // "SubNutrition" field.
  SubNutritionStruct? _subNutrition;
  SubNutritionStruct get subNutrition => _subNutrition ?? SubNutritionStruct();
  set subNutrition(SubNutritionStruct? val) => _subNutrition = val;
  void updateSubNutrition(Function(SubNutritionStruct) updateFn) =>
      updateFn(_subNutrition ??= SubNutritionStruct());
  bool hasSubNutrition() => _subNutrition != null;

  static NutritionStruct fromMap(Map<String, dynamic> data) => NutritionStruct(
        name: data['Name'] as String?,
        units: data['Units'] as String?,
        value: castToType<double>(data['Value']),
        subNutrition: SubNutritionStruct.maybeFromMap(data['SubNutrition']),
      );

  static NutritionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NutritionStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Units': _units,
        'Value': _value,
        'SubNutrition': _subNutrition?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Units': serializeParam(
          _units,
          ParamType.String,
        ),
        'Value': serializeParam(
          _value,
          ParamType.double,
        ),
        'SubNutrition': serializeParam(
          _subNutrition,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NutritionStruct fromSerializableMap(Map<String, dynamic> data) =>
      NutritionStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        units: deserializeParam(
          data['Units'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['Value'],
          ParamType.double,
          false,
        ),
        subNutrition: deserializeStructParam(
          data['SubNutrition'],
          ParamType.DataStruct,
          false,
          structBuilder: SubNutritionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NutritionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NutritionStruct &&
        name == other.name &&
        units == other.units &&
        value == other.value &&
        subNutrition == other.subNutrition;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, units, value, subNutrition]);
}

NutritionStruct createNutritionStruct({
  String? name,
  String? units,
  double? value,
  SubNutritionStruct? subNutrition,
}) =>
    NutritionStruct(
      name: name,
      units: units,
      value: value,
      subNutrition: subNutrition ?? SubNutritionStruct(),
    );
