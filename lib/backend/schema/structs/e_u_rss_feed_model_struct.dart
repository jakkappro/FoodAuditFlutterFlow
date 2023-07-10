// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EURssFeedModelStruct extends BaseStruct {
  EURssFeedModelStruct({
    String? title,
    String? link,
  })  : _title = title,
        _link = link;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "Link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  static EURssFeedModelStruct fromMap(Map<String, dynamic> data) =>
      EURssFeedModelStruct(
        title: data['Title'] as String?,
        link: data['Link'] as String?,
      );

  static EURssFeedModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? EURssFeedModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'Link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'Link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static EURssFeedModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      EURssFeedModelStruct(
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['Link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EURssFeedModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EURssFeedModelStruct &&
        title == other.title &&
        link == other.link;
  }

  @override
  int get hashCode => const ListEquality().hash([title, link]);
}

EURssFeedModelStruct createEURssFeedModelStruct({
  String? title,
  String? link,
}) =>
    EURssFeedModelStruct(
      title: title,
      link: link,
    );
