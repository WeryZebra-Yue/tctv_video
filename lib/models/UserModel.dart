/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the UserModel type in your schema. */
@immutable
class UserModel extends Model {
  static const classType = const _UserModelModelType();
  final String id;
  final String? _email;
  final List<String>? _videos;
  final String? _password;

  @override
  getInstanceType() => classType;
  // 122 650 864
  @override
  String getId() {
    return id;
  }

  String? get email {
    return _email;
  }

  List<String> get videos {
    try {
      return _videos!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get password {
    return _password;
  }

  const UserModel._internal(
      {required this.id, email, required videos, password})
      : _email = email,
        _videos = videos,
        _password = password;

  factory UserModel(
      {String? id,
      String? email,
      required List<String> videos,
      String? password}) {
    return UserModel._internal(
        id: id == null ? UUID.getUUID() : id,
        email: email,
        videos: videos != null ? List<String>.unmodifiable(videos) : videos,
        password: password);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        id == other.id &&
        _email == other._email &&
        DeepCollectionEquality().equals(_videos, other._videos) &&
        _password == other._password;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write(
        "videos=" + (_videos != null ? _videos!.toString() : "null") + ", ");
    buffer.write("password=" + "$_password");
    buffer.write("}");

    return buffer.toString();
  }

  UserModel copyWith(
      {String? id, String? email, List<String>? videos, String? password}) {
    return UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        videos: videos ?? this.videos,
        password: password ?? this.password);
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _email = json['email'],
        _videos = json['videos']?.cast<String>(),
        _password = json['password'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'email': _email, 'videos': _videos, 'password': _password};

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField VIDEOS = QueryField(fieldName: "videos");
  static final QueryField PASSWORD = QueryField(fieldName: "password");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserModel";
    modelSchemaDefinition.pluralName = "UserModels";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserModel.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserModel.VIDEOS,
        isRequired: true,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: describeEnum(ModelFieldTypeEnum.string))));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserModel.PASSWORD,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserModelModelType extends ModelType<UserModel> {
  const _UserModelModelType();

  @override
  UserModel fromJson(Map<String, dynamic> jsonData) {
    return UserModel.fromJson(jsonData);
  }
}
