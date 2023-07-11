// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScannedFoodStruct extends BaseStruct {
  ScannedFoodStruct({
    String? ean,
    String? nu3Socre,
    String? bin,
    String? nova4,
    List<String>? allergens,
  })  : _ean = ean,
        _nu3Socre = nu3Socre,
        _bin = bin,
        _nova4 = nova4,
        _allergens = allergens;

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

  static ScannedFoodStruct fromMap(Map<String, dynamic> data) =>
      ScannedFoodStruct(
        ean: data['EAN'] as String?,
        nu3Socre: data['Nu3Socre'] as String?,
        bin: data['Bin'] as String?,
        nova4: data['Nova4'] as String?,
        allergens: getDataList(data['Allergens']),
      );

  static ScannedFoodStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ScannedFoodStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'EAN': _ean,
        'Nu3Socre': _nu3Socre,
        'Bin': _bin,
        'Nova4': _nova4,
        'Allergens': _allergens,
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
        listEquality.equals(allergens, other.allergens);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([ean, nu3Socre, bin, nova4, allergens]);
}

ScannedFoodStruct createScannedFoodStruct({
  String? ean,
  String? nu3Socre,
  String? bin,
  String? nova4,
}) =>
    ScannedFoodStruct(
      ean: ean,
      nu3Socre: nu3Socre,
      bin: bin,
      nova4: nova4,
    );
