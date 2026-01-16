import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/models/address/district.dart';
import 'package:flutter_base_architecture/models/address/province.dart';
import 'package:flutter_base_architecture/models/address/ward.dart';
import 'package:flutter_base_architecture/pages/login/login.dart';
import 'package:flutter_base_architecture/pages/login/register/component/show_dialog_otp.dart';
import 'package:flutter_base_architecture/repository/filter_repository.dart';
import 'package:flutter_base_architecture/theme/colors.dart';
import 'package:flutter_base_architecture/theme/constant.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_base_architecture/utils/extensions.dart';
import 'package:flutter_base_architecture/widgets/bottom_sheet/percent_bottom_sheet.dart';
import 'package:flutter_base_architecture/widgets/button_with_border.dart';
import 'package:flutter_base_architecture/widgets/filter_outline_button.dart';
import 'package:flutter_base_architecture/widgets/general_input_field.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../api/global_api.dart';
import '../../../models/address/village.dart';
import 'component/filter_bottom_sheet/filter_provider.dart';
import 'component/filter_bottom_sheet/list_filter/list_filter_bottom_sheet.dart';
import 'component/filter_bottom_sheet/list_filter/list_filter_view_model.dart';
import 'register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<String> listRoleName = [
    "Người cao tuổi",
    "Người bảo trợ",
    "Cán bộ Y Tế"
  ];
  Province? province;
  District? district;
  Ward? ward;
  Village? village;
  //disable information from data XTM
  bool isDisable = false;
  @override
  void initState() {
    context.read<FilterProvider>().resetManufactureFilter();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    final viewModel = context.watch<RegisterViewModel>();
    if (globalApi.dataUserXTM?.logout == false && !viewModel.isRegister) {
      viewModel.nameFieldController
        ..text = globalApi.dataUserXTM?.user?.fullName ?? '';
      viewModel.user.fullName = globalApi.dataUserXTM?.user?.fullName;

      viewModel.phoneFieldController
        ..text = globalApi.dataUserXTM?.user?.phoneNumber ?? '';
      viewModel.user.phoneNumber = globalApi.dataUserXTM?.user?.phoneNumber;
      isDisable = true;
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RegisterViewModel>();
    final filter = context.watch<FilterProvider>();
    if (isDisable && !viewModel.isRegister) {
      province = globalApi.dataUserXTM?.user?.province;
      district = globalApi.dataUserXTM?.user?.district;
      ward = globalApi.dataUserXTM?.user?.ward;
      village = globalApi.dataUserXTM?.user?.village;

      filter.updateManufactureFilter(
          globalApi.dataUserXTM?.user?.province, Province);
      filter.updateManufactureFilter(
          globalApi.dataUserXTM?.user?.district, District);
      filter.updateManufactureFilter(globalApi.dataUserXTM?.user?.ward, Ward);
      filter.updateManufactureFilter(
          globalApi.dataUserXTM?.user?.village, Village);
    }

    province = filter.manufactureProvince;
    district = filter.manufactureDistrict;
    ward = filter.manufactureWard;
    if (province != null) {
      viewModel.user.provinceId = province?.id;
    }
    if (district != null) {
      viewModel.user.districtId = district?.id;
    } else {
      viewModel.user.districtId = null;
    }
    if (ward != null) {
      viewModel.user.wardId = ward?.id;
    } else {
      viewModel.user.wardId = null;
    }
    return GestureDetector(
      onTap: () {
        context.hideKeyboard();
      },
      child: WillPopScope(
        onWillPop: () async {
          if (viewModel.checkBackRegisterForm()) {
            showDialogBackGesture(
                context: context,
                onConfirm: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
          } else {
            Navigator.pop(context);
          }
          return false;
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        if (viewModel.checkBackRegisterForm()) {
                          showDialogBackGesture(
                              context: context,
                              onConfirm: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: AppColors.textGrayColor[800],
                      )),
                  registerText(context, listRoleName[viewModel.accountType]),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildNameField(displayText: "Họ và tên"),
                          SizedBox(height: 8),
                          Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: viewModel.formKey1,
                            child: GeneralInputField(
                              readOnly: isDisable && !viewModel.isRegister
                                  ? true
                                  : false,
                              focusNode: viewModel.focusNameField,
                              controller: viewModel.nameFieldController,
                              hint: "Nhập họ và tên",
                              textCapital: TextCapitalization.words,
                              validator: viewModel.validateName,
                              onChanged: (value) {
                                viewModel.user.fullName = value;
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          buildNameField(displayText: "Số điện thoại"),
                          SizedBox(height: 8),
                          Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: viewModel.formKey2,
                            child: GeneralInputField(
                              readOnly: isDisable && !viewModel.isRegister
                                  ? true
                                  : false,
                              focusNode: viewModel.focusPhoneNumberField,
                              controller: viewModel.phoneFieldController,
                              hint: "Nhập số điện thoại",
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^[0-9]{0,10}'))
                              ],
                              validator: viewModel.validatePhone,
                              onChanged: (value) {
                                viewModel.user.phoneNumber = value;
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          buildNameField(displayText: "Địa chỉ"),
                          SizedBox(height: 8),
                          FilterOutlinedButton(
                            isSelected: province != null,
                            content: province?.name ?? 'Tỉnh/Thành phố',
                            onPressed: isDisable && !viewModel.isRegister ? null : () {
                              PercentBottomSheet.show(
                                      context,
                                      ChangeNotifierProvider<
                                          ListFilterViewModel>(
                                        create: (_) => ListFilterViewModel<
                                                Province>(
                                            context.read<FilterRepository>(),
                                            selectedItem: province),
                                        child: ListFilterBottomSheet(
                                          title: 'Tỉnh/Thành phố',
                                          searchHint: "Tìm tên Tỉnh/Thành phố",
                                          hasBackIcon: true,
                                          hasSearchInput: true,
                                        ),
                                      ),
                                      percent: 1)
                                  .then((value) {
                                if (value is Tuple2) {
                                  viewModel.errorProvince = null;
                                  filter.updateManufactureFilter(
                                      value.item2, Province);
                                }
                              });
                            },
                            errorText: viewModel.errorProvince,
                          ),

                          SizedBox(height: 6),

                          FilterOutlinedButton(
                            isDisable: province == null,
                            onPressed:isDisable ? null : () {
                              if (province == null) return;
                              PercentBottomSheet.show(
                                      context,
                                      ChangeNotifierProvider<
                                          ListFilterViewModel>(
                                        create: (_) => ListFilterViewModel<
                                                District>(
                                            context.read<FilterRepository>(),
                                            selectedItem: district,
                                            provinceId: province?.id),
                                        child: ListFilterBottomSheet(
                                          title: 'Huyện/Thị xã/Thành phố',
                                          searchHint:
                                              "Tìm tên Huyện/Thị xã/Thành phố",
                                          hasBackIcon: true,
                                          hasSearchInput: true,
                                        ),
                                      ),
                                      percent: 1)
                                  .then((value) {
                                if (value is Tuple2) {
                                  viewModel.errorDistrict = null;
                                  filter.updateManufactureFilter(
                                      value.item2, District);
                                }
                              });
                            },
                            isSelected: district != null,
                            content: district?.name ?? 'Huyện/Thị xã/Thành phố',
                            errorText: viewModel.errorDistrict,
                          ),
                          SizedBox(height: 6),
                          FilterOutlinedButton(
                            isDisable: district == null,
                            onPressed: isDisable ? null : () {
                              if (district == null) return;
                              PercentBottomSheet.show(
                                      context,
                                      ChangeNotifierProvider<
                                          ListFilterViewModel>(
                                        create: (_) => ListFilterViewModel<
                                                Ward>(
                                            context.read<FilterRepository>(),
                                            selectedItem: ward,
                                            districtId: district?.id),
                                        child: ListFilterBottomSheet(
                                          title: 'Phường/Xã',
                                          searchHint: "Tìm tên Phường/Xã",
                                          hasBackIcon: true,
                                          hasSearchInput: true,
                                        ),
                                      ),
                                      percent: 1)
                                  .then((value) {
                                if (value is Tuple2) {
                                  viewModel.errorWard = null;
                                  filter.updateManufactureFilter(
                                      value.item2, Ward);
                                }
                              });
                            },
                            isSelected: ward != null,
                            content: ward?.name ?? 'Phường/Xã',
                            errorText: viewModel.errorWard,
                          ),
                          SizedBox(height: 16),
                          if(viewModel.isRegister) buildNameField(displayText: "Mật khẩu"),
                          if(viewModel.isRegister) SizedBox(height: 8),
                          if(viewModel.isRegister) Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: viewModel.formKey3,
                            child: GeneralInputField(
                              focusNode: viewModel.focusPasswordField,
                              controller: viewModel.passwordFieldController,
                              hint: "Nhập mật khẩu",
                              textCapital: TextCapitalization.none,
                              obscureText1: true,
                              onChanged: (value) {
                                viewModel.onChangedPassword(value);
                                viewModel.user.password = value;
                              },
                              validator: viewModel.validatePassword,
                            ),
                          ),
                          if(viewModel.isRegister) SizedBox(height: 16),
                          if(viewModel.isRegister) buildNameField(displayText: "Nhập lại mật khẩu"),
                          if(viewModel.isRegister) SizedBox(height: 8),
                          if(viewModel.isRegister) Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: viewModel.formKey4,
                            child: GeneralInputField(
                              focusNode: viewModel.focusRePasswordField,
                              controller: viewModel.rePasswordFieldController,
                              hint: "Nhập lại mật khẩu",
                              textCapital: TextCapitalization.none,
                              obscureText1: true,
                              validator: viewModel.validateRePassword,
                              onChanged: (value) {
                                viewModel.user.rePassword = value;
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          StreamBuilder<String>(
                            stream: viewModel.passwordSubject.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildPasswordAtleast8Character(
                                        snapshot.requireData),
                                    SizedBox(height: 8),
                                    _buildContainNumberUpperCaseLowerCase(
                                        snapshot.requireData)
                                  ],
                                );
                              } else {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildPasswordAtleast8Character(""),
                                    SizedBox(height: 8),
                                    _buildContainNumberUpperCaseLowerCase("")
                                  ],
                                );
                              }
                            },
                          ),
                          if (viewModel.accountType ==
                              Constant.MEDICAL_STAFF_INDEX)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16),
                                buildNameField(
                                    displayText:
                                        "Hình ảnh/File PDF chứng chỉ hành nghề"),
                                SizedBox(height: 8),
                                buildUploadFile(context)
                              ],
                            ),
                          SizedBox(height: 16),
                          BuildCheckPolicyPrivate(),
                          SizedBox(height: 40),
                          NormalButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 25),
                                Text(
                                  "Đăng ký",
                                  style:
                                      AppStyles.textTheme.titleLarge!.copyWith(
                                    color: AppColors.textWhite,
                                  ),
                                ),
                                SizedBox(width: 5),
                                viewModel.isLoading
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                            color: AppColors.primaryBlue[400],
                                            strokeWidth: 3))
                                    : SizedBox(width: 20),
                              ],
                            ),
                            radius: 8,
                            onPressed: (viewModel.isCheckPrivatePolicy &&
                                    !viewModel.isLoading &&
                                    viewModel.uploadingFile ==
                                        UploadStatus.NONE)
                                ? () {
                                    if (viewModel.checkValidate()) return;
                                   if(isDisable) 
                                    viewModel.register();
                                   
                                   else viewModel.checkPhoneNumber().then((value) {
                                      if (value) {
                                        showDialogOtp(context: context);
                                      }
                                    });
                                  }
                                : null,
                          ),
                          SizedBox(height: 47)
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordAtleast8Character(String password) {
    bool check = password.length >= 8;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check,
          size: 18,
          color:
              check ? AppColors.primaryBlue[500] : AppColors.textGrayColor[500],
        ),
        SizedBox(width: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width - 58,
          child: Text(
            "Mật khẩu phải có ít nhất 8 ký tự",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: check
                  ? AppColors.primaryBlue[500]
                  : AppColors.textGrayColor[500],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainNumberUpperCaseLowerCase(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*\d)');
    bool check = regex.hasMatch(value);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check,
          size: 18,
          color:
              check ? AppColors.primaryBlue[500] : AppColors.textGrayColor[500],
        ),
        SizedBox(width: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width - 58,
          child: Text(
            "Bao gồm số, chữ viết hoa, chữ viết thường",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: check
                  ? AppColors.primaryBlue[500]
                  : AppColors.textGrayColor[500],
            ),
          ),
        )
      ],
    );
  }
}
