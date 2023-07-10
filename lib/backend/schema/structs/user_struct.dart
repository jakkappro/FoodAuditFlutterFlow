// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? firstName,
    String? lastName,
    List<String>? intolerancies,
    DateTime? dateOfBirdth,
    bool? dOBSelected,
  })  : _firstName = firstName,
        _lastName = lastName,
        _intolerancies = intolerancies,
        _dateOfBirdth = dateOfBirdth,
        _dOBSelected = dOBSelected;

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;
  bool hasLastName() => _lastName != null;

  // "Intolerancies" field.
  List<String>? _intolerancies;
  List<String> get intolerancies => _intolerancies ?? const [];
  set intolerancies(List<String>? val) => _intolerancies = val;
  void updateIntolerancies(Function(List<String>) updateFn) =>
      updateFn(_intolerancies ??= []);
  bool hasIntolerancies() => _intolerancies != null;

  // "DateOfBirdth" field.
  DateTime? _dateOfBirdth;
  DateTime? get dateOfBirdth => _dateOfBirdth;
  set dateOfBirdth(DateTime? val) => _dateOfBirdth = val;
  bool hasDateOfBirdth() => _dateOfBirdth != null;

  // "DOBSelected" field.
  bool? _dOBSelected;
  bool get dOBSelected => _dOBSelected ?? false;
  set dOBSelected(bool? val) => _dOBSelected = val;
  bool hasDOBSelected() => _dOBSelected != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        firstName: data['FirstName'] as String?,
        lastName: data['LastName'] as String?,
        intolerancies: getDataList(data['Intolerancies']),
        dateOfBirdth: data['DateOfBirdth'] as DateTime?,
        dOBSelected: data['DOBSelected'] as bool?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'FirstName': _firstName,
        'LastName': _lastName,
        'Intolerancies': _intolerancies,
        'DateOfBirdth': _dateOfBirdth,
        'DOBSelected': _dOBSelected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'FirstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'LastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'Intolerancies': serializeParam(
          _intolerancies,
          ParamType.String,
          true,
        ),
        'DateOfBirdth': serializeParam(
          _dateOfBirdth,
          ParamType.DateTime,
        ),
        'DOBSelected': serializeParam(
          _dOBSelected,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        firstName: deserializeParam(
          data['FirstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['LastName'],
          ParamType.String,
          false,
        ),
        intolerancies: deserializeParam<String>(
          data['Intolerancies'],
          ParamType.String,
          true,
        ),
        dateOfBirdth: deserializeParam(
          data['DateOfBirdth'],
          ParamType.DateTime,
          false,
        ),
        dOBSelected: deserializeParam(
          data['DOBSelected'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        listEquality.equals(intolerancies, other.intolerancies) &&
        dateOfBirdth == other.dateOfBirdth &&
        dOBSelected == other.dOBSelected;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([firstName, lastName, intolerancies, dateOfBirdth, dOBSelected]);
}

UserStruct createUserStruct({
  String? firstName,
  String? lastName,
  DateTime? dateOfBirdth,
  bool? dOBSelected,
}) =>
    UserStruct(
      firstName: firstName,
      lastName: lastName,
      dateOfBirdth: dateOfBirdth,
      dOBSelected: dOBSelected,
    );
