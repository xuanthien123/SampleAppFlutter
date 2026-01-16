import 'dart:io';

import '../app_config.dart';



bool isImageFromPath(String file) {
  if (file == "jpg" || file == "png" || file == "jpeg" || file == "gif" || file == "bmp") {
    return true;
  } else {
    return false;
  }
}

bool isFileFromPath(String file) {
  if (file == "docx" || file == "xlsx" || file == "pdf" || file == "doc" || file == "pptx" || file == "xls" || file == "txt" || file == "ppt") {
    return true;
  } else {
    return false;
  }
}

bool isVideoFromPath(String file) {
  if (file == "mp4" || file == "mov" || file == "avi" || file == "wmv" || file == "rmvb" || file == "mpg" || file == "mpeg" || file == "3gp" ) {
    return true;
  } else {
    return false;
  }
}

bool isExceptImage(List<File> listFile) {
  List<String> listType = [];
  List<String> unAcceptFile = ['webp'];
  for (var i in listFile) {
    listType.add(i.path);
  }
  for (var element in listType) {
    if (unAcceptFile.contains(element.split('.').last)) {
      // FlushBarUtil.showError("Định dạng ảnh gửi lên chưa hỗ trợ");
      return false;
    }
  }
  return true;

}
String checkDomainImage(String image, {String baseUrl = AppConfig.baseUrl}){
  if (image.isEmpty) return '';
  return image.contains('http') ? image : '$baseUrl$image';
}