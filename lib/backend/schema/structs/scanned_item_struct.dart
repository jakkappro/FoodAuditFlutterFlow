// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScannedItemStruct extends BaseStruct {
  ScannedItemStruct({
    String? ean,
    DateTime? lastScanned,
    bool? isFavourite,
    int? numberOfScans,
  })  : _ean = ean,
        _lastScanned = lastScanned,
        _isFavourite = isFavourite,
        _numberOfScans = numberOfScans;

  // "EAN" field.
  String? _ean;
  String get ean => _ean ?? '';
  set ean(String? val) => _ean = val;
  bool hasEan() => _ean != null;

  // "LastScanned" field.
  DateTime? _lastScanned;
  DateTime? get lastScanned => _lastScanned;
  set lastScanned(DateTime? val) => _lastScanned = val;
  bool hasLastScanned() => _lastScanned != null;

  // "IsFavourite" field.
  bool? _isFavourite;
  bool get isFavourite => _isFavourite ?? false;
  set isFavourite(bool? val) => _isFavourite = val;
  bool hasIsFavourite() => _isFavourite != null;

  // "NumberOfScans" field.
  int? _numberOfScans;
  int get numberOfScans => _numberOfScans ?? 0;
  set numberOfScans(int? val) => _numberOfScans = val;
  void incrementNumberOfScans(int amount) =>
      _numberOfScans = numberOfScans + amount;
  bool hasNumberOfScans() => _numberOfScans != null;

  static ScannedItemStruct fromMap(Map<String, dynamic> data) =>
      ScannedItemStruct(
        ean: data['EAN'] as String?,
        lastScanned: data['LastScanned'] as DateTime?,
        isFavourite: data['IsFavourite'] as bool?,
        numberOfScans: castToType<int>(data['NumberOfScans']),
      );

  static ScannedItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ScannedItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'EAN': _ean,
        'LastScanned': _lastScanned,
        'IsFavourite': _isFavourite,
        'NumberOfScans': _numberOfScans,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'EAN': serializeParam(
          _ean,
          ParamType.String,
        ),
        'LastScanned': serializeParam(
          _lastScanned,
          ParamType.DateTime,
        ),
        'IsFavourite': serializeParam(
          _isFavourite,
          ParamType.bool,
        ),
        'NumberOfScans': serializeParam(
          _numberOfScans,
          ParamType.int,
        ),
      }.withoutNulls;

  static ScannedItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScannedItemStruct(
        ean: deserializeParam(
          data['EAN'],
          ParamType.String,
          false,
        ),
        lastScanned: deserializeParam(
          data['LastScanned'],
          ParamType.DateTime,
          false,
        ),
        isFavourite: deserializeParam(
          data['IsFavourite'],
          ParamType.bool,
          false,
        ),
        numberOfScans: deserializeParam(
          data['NumberOfScans'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ScannedItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScannedItemStruct &&
        ean == other.ean &&
        lastScanned == other.lastScanned &&
        isFavourite == other.isFavourite &&
        numberOfScans == other.numberOfScans;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([ean, lastScanned, isFavourite, numberOfScans]);
}

ScannedItemStruct createScannedItemStruct({
  String? ean,
  DateTime? lastScanned,
  bool? isFavourite,
  int? numberOfScans,
}) =>
    ScannedItemStruct(
      ean: ean,
      lastScanned: lastScanned,
      isFavourite: isFavourite,
      numberOfScans: numberOfScans,
    );
