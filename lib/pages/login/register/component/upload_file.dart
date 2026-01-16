import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/pages/permission.dart';
import 'package:flutter_base_architecture/res.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_base_architecture/utils/extensions/context_extension.dart';
import 'package:flutter_base_architecture/widgets/flush_bar_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../register.dart';

Widget buildUploadFile(BuildContext context) {
  final viewModel = context.watch<RegisterViewModel>();
  print("FILE COUNT == ${viewModel.listUploadProcess.length}");
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: viewModel.uploadingFile != UploadStatus.NONE 
        ? () => FlushBarUtil.showMessage(message: "Đang tải lên, vui lòng đợi...")
        : () async {
          try {
            await PermissionHandler.checkPermissionStorage();
            bool isAllow = await PermissionHandler.isStoragePermissionAllow();
            if (isAllow) {
              EasyLoading.show(dismissOnTap: false);
              FilePickerResult? result = await FilePicker.platform
                  .pickFiles(
                      allowMultiple: true,
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
                      withData: false);
              print('PICKER FILE $result');
              if (result != null) {
                print('PICKER FILE RESULT');
                List<String?> filePaths = result.paths;
                viewModel.fileUploadCount = filePaths.length;
                viewModel.uploadingFile = UploadStatus.PENDING;
                for (String? e in filePaths) {
                  if(e != null) {
                    viewModel.uploadFileImage(e);
                  }
                }
              } else {
                print('CANNOT PICKER FILE');
              }
              EasyLoading.dismiss();
            }
          } catch (e) {
            // print('CANNOT PICKER FILE ${e.toString()}');
            EasyLoading.dismiss();
            FlushBarUtil.showMessage(message: "Lỗi hệ điều hành ${e.toString()}");
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 139,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.backgroundColorSelectFile
          ),
          child: DottedBorder(
            dashPattern: [9, 9],
            borderType: BorderType.RRect,
            radius: Radius.circular(8),
            color: AppColors.primaryBlue[500]!,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    color: AppColors.primaryBlue[500],
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Chọn tập tin của bạn",
                    style: AppStyles.textTheme.bodyLarge!.copyWith(color: AppColors.textGrayColor[500]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      if (viewModel.errorUploadFile != null)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            Text(
              viewModel.errorUploadFile!,
              style: TextStyle(
                color: AppColors.errorColor[500],
                fontSize: 12,
              ),
            )
          ],
        ),
      // if (viewModel.listUploadProcess.isNotEmpty)
      StreamBuilder<List<UploadProcess>>(
        stream: viewModel.listUploadProcessSubject,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return SizedBox();
          if (snapshot.data!.isEmpty) return SizedBox();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              buildNameField(
                displayText: "File đã chọn",
                isRequired: false
              ),
              SizedBox(height: 8),
              ListView.separated(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  bool isPdf = viewModel.isPdf(snapshot.data![index].file.path);
                  String fileName = snapshot.data![index].file.path.split('/').last;
                  return Container(
                    height: 80,
                    width: context.width,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1.5,
                          color: AppColors.textGrayColor[200]!,
                          offset: Offset(0, 0)
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        if (isPdf) 
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Center(
                            child: Image.asset(
                              Res.file_pdf,
                              height: 55,
                            ),
                          ),
                        ),
                        if (!isPdf)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.file(
                            snapshot.data![index].file,
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: context.width - 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 33,
                                    width: context.width - 144,
                                    child: Text(
                                      fileName,
                                      style: AppStyles.textTheme.bodyLarge,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () => viewModel.removeFile(index),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.textGrayColor[50]
                                      ),
                                      padding: EdgeInsets.all(3),
                                      child: Icon(
                                        Icons.close,
                                        color: AppColors.textGrayColor[800],
                                        size: 18,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                    child: Text(
                                      viewModel.getFileLength(snapshot.data![index].file),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textGrayColor[300]
                                      ),
                                    ),
                                  ),
                                  if (snapshot.data![index].isError == true)
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.error_outline,
                                        color: AppColors.errorColor,
                                        size: 13.2,
                                      ),
                                      SizedBox(width: 3),
                                      SizedBox(
                                        height: 15,
                                        child: Text(
                                          "Lỗi tải lên",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.errorColor[300]
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5),
                                  if (snapshot.data![index].imageUrl != null) 
                                  Icon(
                                    Icons.check,
                                    color: AppColors.primaryBlue,
                                    size: 13.2,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 4,
                                  width: context.width - 64,
                                  child: snapshot.data![index].isError == true 
                                  ? LinearProgressIndicator(
                                      minHeight: 6,
                                      backgroundColor: AppColors.errorColor[50],
                                      color: AppColors.errorColor[500],
                                      value: 1
                                    )
                                  : LinearProgressIndicator(
                                      minHeight: 6,
                                      backgroundColor: AppColors.primaryBlue[50],
                                      color: AppColors.primaryBlue[500],
                                      value: snapshot.data![index].sent == null && snapshot.data![index].total == null
                                      ? null 
                                      : snapshot.data![index].sent! / snapshot.data![index].total!
                                    )
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
              ),
            ],
          );
        }
      )
    ],
  );
}