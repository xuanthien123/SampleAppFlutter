import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base_architecture/api/client_ck.dart';
import 'package:flutter_base_architecture/api/response_model/upload_image_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base_architecture/utils/file_ultil.dart';

import '../app_config.dart';
import 'package:image/image.dart' as img;

Future<File> decodeImage(File file) async {
  img.Image? image = await compute(img.decodeImage, File(file.path).readAsBytesSync());
  // img.Image? image = img.decodeImage(new File(file.path).readAsBytesSync());
  img.Image thumbnail = await compute(copyResize, image!);
  return File(file.path)
      ..writeAsBytesSync(await compute(img.encodePng, thumbnail));
}
img.Image copyResize(img.Image image) {
  return img.copyResize(image, height: 1280);
}

class UploadFileBloc with ChangeNotifier {
  Future<List<UploadImageResponse>> uploadFiles(List<File> files,
      {String baseImage = AppConfig.baseUrl}) async {
    List<UploadImageResponse> responseUploadFiles = [];
    for (var file in files) {
      String type;
      String fileName = file.path.split('/').last.toLowerCase();
      bool exits = await file.exists();
      if (exits) {
        if (file.path.toLowerCase().endsWith(".jpg") ||
            file.path.toLowerCase().endsWith(".jpeg") ||
            file.path.toLowerCase().endsWith(".png") ||
            file.path.toLowerCase().endsWith(".bmp") ||
            file.path.toLowerCase().endsWith(".webp")) {
          type = "Images";
          file = await decodeImage(file);
        } else {
          type = "Videos";
        }
        FormData formData = FormData.fromMap({
          "upload": await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        });

        final data = await ClientCK.instance.dio.post(
          "$baseImage/ckfinder/core/connector/php/connector.php?command=FileUpload&currentFolder=&hash=523cac8c2c3bbeda&responseType=json&type=$type",
          data: formData,
        );
        UploadImageResponse responseUploadFile =
            UploadImageResponse.fromJson(data.data);
        responseUploadFiles.add(responseUploadFile);
      }
    }
    return responseUploadFiles;
  }

  Future<UploadImageResponse> uploadSingleFile(File file, 
        {String baseImage = AppConfig.baseUrl, bool decode = false, void Function(int, int)? onSendProgress}) async {
    if (decode) {
      file = await decodeImage(file);
    }
    String fileName = file.path.split('/').last;
    String fileType = fileName.split('.').last;
    String type = "";
    if (isImageFromPath(fileType)) type = "Images";
    else if (isFileFromPath(fileType)) type = "Files";
    else type = "Videos";
    FormData formData = FormData.fromMap({
      "upload": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    final data = await ClientCK.instance.dio.post(
      "${baseImage}/ckfinder/core/connector/php/connector.php?command=FileUpload&currentFolder=&hash=523cac8c2c3bbeda&responseType=json&type=$type",
      data: formData,
      onSendProgress: onSendProgress
    );
    UploadImageResponse responseUploadFile =
        UploadImageResponse.fromJson(data.data);

    return responseUploadFile;
  }
}
