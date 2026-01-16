// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponse _$UploadImageResponseFromJson(Map<String, dynamic> json) =>
    UploadImageResponse(
      json['resourceType'] as String?,
      json['fileName'] as String?,
      json['uploaded'] as int?,
      json['currentFolder'] == null
          ? null
          : CurrentFolder.fromJson(
              json['currentFolder'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadImageResponseToJson(
        UploadImageResponse instance) =>
    <String, dynamic>{
      'resourceType': instance.resourceType,
      'fileName': instance.fileName,
      'uploaded': instance.uploaded,
      'currentFolder': instance.currentFolder,
    };

CurrentFolder _$CurrentFolderFromJson(Map<String, dynamic> json) =>
    CurrentFolder(
      json['path'] as String?,
      json['acl'] as int?,
      json['url'] as String?,
    );

Map<String, dynamic> _$CurrentFolderToJson(CurrentFolder instance) =>
    <String, dynamic>{
      'path': instance.path,
      'acl': instance.acl,
      'url': instance.url,
    };
