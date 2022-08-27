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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the VideoModel type in your schema. */
@immutable
class VideoModel extends Model {
  static const classType = const _VideoModelModelType();
  final String id;
  final String? _Video_Title;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get Video_Title {
    return _Video_Title;
  }
  
  const VideoModel._internal({required this.id, Video_Title}): _Video_Title = Video_Title;
  
  factory VideoModel({String? id, String? Video_Title}) {
    return VideoModel._internal(
      id: id == null ? UUID.getUUID() : id,
      Video_Title: Video_Title);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoModel &&
      id == other.id &&
      _Video_Title == other._Video_Title;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("VideoModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Video_Title=" + "$_Video_Title");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  VideoModel copyWith({String? id, String? Video_Title}) {
    return VideoModel(
      id: id ?? this.id,
      Video_Title: Video_Title ?? this.Video_Title);
  }
  
  VideoModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Video_Title = json['Video_Title'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Video_Title': _Video_Title
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField VIDEO_TITLE = QueryField(fieldName: "Video_Title");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "VideoModel";
    modelSchemaDefinition.pluralName = "VideoModels";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: VideoModel.VIDEO_TITLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _VideoModelModelType extends ModelType<VideoModel> {
  const _VideoModelModelType();
  
  @override
  VideoModel fromJson(Map<String, dynamic> jsonData) {
    return VideoModel.fromJson(jsonData);
  }
}