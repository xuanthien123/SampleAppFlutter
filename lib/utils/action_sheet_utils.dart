import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:image_picker/image_picker.dart';

class ActionSheetUtils {
  static ActionSheetUtils _instance = ActionSheetUtils.internal();

  ActionSheetUtils.internal();

  factory ActionSheetUtils() => _instance;

  static void showPickerImage(
    BuildContext context, {
    Function(XFile)? onCameraSelected,
    Function(XFile)? onImageSelected,
    Function(List<XFile>)? onMultiImageSelected,
    bool multiSelection = false,
  }) {
    showCupertinoModalPopup(
        context: context,
        builder: (actionContext) {
          return CupertinoActionSheet(
            title: Text(
              'Chọn ảnh',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryGreen, fontSize: 18),
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(actionContext);
                  final ImagePicker _picker = ImagePicker();
                  final XFile? image = await _picker.pickImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1920);
                  if (image != null) onCameraSelected?.call(image);
                },
                child: Text(
                  'Từ máy ảnh',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryGreen,
                        fontSize: 16,
                      ),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(actionContext);
                  final ImagePicker _picker = ImagePicker();
                  if (multiSelection) {
                    final List<XFile>? images = await _picker.pickMultiImage(maxHeight: 1080, maxWidth: 1920);
                    if (images != null) onMultiImageSelected?.call(images);
                  } else {
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1920);
                    if (image != null) onImageSelected?.call(image);
                  }
                },
                child: Text(
                  'Từ thư viện ảnh',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryGreen, fontSize: 16),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(actionContext);
              },
              child: Text(
                'Hủy',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryGreen, fontSize: 16),
              ),
            ),
          );
        });
  }
}
