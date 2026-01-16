import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/pages/home_page.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_base_architecture/widgets/cached_network_image_widget.dart';
import 'package:provider/provider.dart';

import '../../../api/global_api.dart';
import '../../../res.dart';
import '../../../theme/colors.dart';
import '../../../utils/file_ultil.dart';
import '../../../widgets/flush_bar_util.dart';
import '../login.dart';

class AccountUserXTM extends StatefulWidget {
  BuildContext context;
  AccountUserXTM({Key? key, required this.context}) : super(key: key);

  @override
  State<AccountUserXTM> createState() => _AccountUserXTMState();
}

class _AccountUserXTMState extends State<AccountUserXTM> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final viewModel = widget.context.watch<LoginViewModel>();
    String nameXTM = viewModel.dataUserXTM.user == null
                  ? viewModel.userXTM.fullName ?? ""
                  : viewModel.dataUserXTM.user?.fullName ?? "";
    String avatar = viewModel.dataUserXTM.user == null
                  ? viewModel.userXTM.avatar ?? ""
                  : viewModel.dataUserXTM.user?.avatar ?? "";
    String phoneNumber = viewModel.dataUserXTM.user == null
                  ? viewModel.userXTM.phoneNumber ?? ""
                  : viewModel.dataUserXTM.user?.phoneNumber ?? "";
    return Container(
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () async {
              await viewModel.logout(phoneNumber);
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Text(
                'Đăng xuất',
                style: AppStyles.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(avatar),
              backgroundColor: AppColors.grey,
              child: viewModel.dataUserXTM.user?.avatar == null ||
                      viewModel.dataUserXTM.user?.avatar == ''
                  ? Icon(Icons.person, size: 50, color: AppColors.textWhite)
                  : null),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              nameXTM,
              style: AppStyles.titleLarge.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          GestureDetector(
            onTap: () async{
              
              Navigator.of(context, rootNavigator: true).pop();
              if (viewModel.existAccountXTM?.exists == false &&
                  viewModel.dataUserXTM.logout == false) {
                FlushBarUtil.showError(
                    "Bạn chưa tích hợp tài khoản Xã Thông Minh");
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        RegisterSelectRole(isCheckRegister: false,));
              } else
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageScreen(
                          text:
                              "Bạn đang đăng nhập tài khoản: $nameXTM"),
                    ));
            },
            child: FittedBox(
              child: Container(
                  width: size.width,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  margin: EdgeInsets.only(top: 20),
                  child: Text(viewModel.existAccountXTM?.exists == false &&
                    viewModel.dataUserXTM.logout == false ? 'Tích hợp với Tài khoản $nameXTM' :'Tiếp tục dưới tên $nameXTM',
                      style: AppStyles.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textWhite))),
            ),
          ),
        ],
      ),
    );
  }
}
