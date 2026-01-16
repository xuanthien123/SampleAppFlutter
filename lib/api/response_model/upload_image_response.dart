import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  final String? resourceType;
  final String? fileName;
  final int? uploaded;
  final CurrentFolder? currentFolder;



  UploadImageResponse(this.resourceType, this.fileName, this.uploaded, this.currentFolder);

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) => _$UploadImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResponseToJson(this);

}

@JsonSerializable()
class CurrentFolder {
  final String? path;
  final int? acl;
  final String? url;

  factory CurrentFolder.fromJson(Map<String, dynamic> json) => _$CurrentFolderFromJson(json);

  CurrentFolder(this.path, this.acl, this.url);

  Map<String, dynamic> toJson() => _$CurrentFolderToJson(this);

}



