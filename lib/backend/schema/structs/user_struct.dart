// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? firstName,
    String? lastName,
    List<String>? intolerancies,
    DateTime? dateOfBirdth,
    bool? dOBSelected,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstName = firstName,
        _lastName = lastName,
        _intolerancies = intolerancies,
        _dateOfBirdth = dateOfBirdth,
        _dOBSelected = dOBSelected,
        super(firestoreUtilData);

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      firstName: firstName,
      lastName: lastName,
      dateOfBirdth: dateOfBirdth,
      dOBSelected: dOBSelected,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && user.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = user.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
