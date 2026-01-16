import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/api/global_api.dart';
import 'package:flutter_base_architecture/api/request_model/request_register/user_register.dart';
import 'package:flutter_base_architecture/api/upload_file_bloc.dart';
import 'package:flutter_base_architecture/base/base_view_model.dart';
import 'package:flutter_base_architecture/repository/login_repository.dart';
import 'package:flutter_base_architecture/theme/constant.dart';
import 'package:flutter_base_architecture/utils/extensions.dart';
import 'package:flutter_base_architecture/widgets/flush_bar_util.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../home_page.dart';

class RegisterViewModel extends BaseViewModel {
  final int accountType;
  final bool isRegister;
  final LoginRepository repository;
  final BuildContext context;
  StreamSubscription<dynamic>? _stream;
  List<UploadProcess> listUploadProcess = [];
  RegisterViewModel({required this.repository, required this.accountType, required this.context, required this.isRegister}) : super(repository) {
    _stream = imageUploadStream.listen((event) {
      if (event is String) {
        final file = File(event);
        listUploadProcess.add(UploadProcess(file: file));
        fileUploadCount--;
        if (fileUploadCount == 0) {
          uploadFileSelected(context);
        }
        notifyListeners();
      }
    });
  }

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();

  final focusNameField = FocusNode();
  final focusPhoneNumberField = FocusNode();
  final focusPasswordField = FocusNode();
  final focusRePasswordField = FocusNode();
  
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController rePasswordFieldController = TextEditingController();

  String? errorProvince;
  String? errorDistrict;
  String? errorWard;
  String? errorUploadFile;

  bool _isCheckPrivatePolicy = false;
  bool get isCheckPrivatePolicy => _isCheckPrivatePolicy;
  set isCheckPrivatePolicy(bool value) {
    _isCheckPrivatePolicy = value;
    notifyListeners();
  }

  final passwordSubject = PublishSubject<String>();
  final timerSubject = PublishSubject<int>();

  final PublishSubject imageUpload = new PublishSubject<String>();
  Stream get imageUploadStream => imageUpload.stream;

  final PublishSubject<List<UploadProcess>> listUploadProcessSubject = PublishSubject<List<UploadProcess>>();
  Stream get listUploadProcessStream => listUploadProcessSubject.stream;

  Timer? _timer;
  bool isTimeout = false;
  int _counter = 0;

  int fileUploadCount = 0;
  UploadStatus uploadingFile = UploadStatus.NONE;

  UserRegister user = UserRegister(certificates: []);

  void startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // ignore: unnecessary_statements

      (_counter > 0) ? _counter-- : {_timer!.cancel(), isTimeout = true};
      timerSubject.add(_counter);
    });
  }
  void resetTimer() {
    startTimer();
  }

  void onChangedPassword(String value) {
    passwordSubject.add(value);
  }

  void uploadFileImage(String file){
    imageUpload.add(file);
  }

  @override
  void dispose() {
    passwordSubject.close();
    timerSubject.close();
    imageUpload.close();
    _stream?.cancel();
    listUploadProcessSubject.close();
    super.dispose();
  }

  String? validateName(String? name) {
    if (name!.trim().isEmpty) {
      return 'Vui lòng nhập họ và tên';
    }
    return null;
  }

  String? validatePhone(String? phoneNumber) {
    if (phoneNumber!.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    if (phoneNumber[0] != '0') return 'Số điện thoại phải bắt đầu bằng số 0';
    if (!phoneNumber.isValidPhone) {
      return 'Sai định dạng số điện thoại';
    }
    return null;
  }

  bool validateProvince() {
    if (user.provinceId == null) {
      errorProvince = "Vui lòng nhập Tỉnh/Thành phố";
    } else {
      errorProvince = null;
    }
    notifyListeners();
    return errorProvince == null;
  }

  bool validateDistrict() {
    if (user.districtId == null) {
      errorDistrict = "Vui lòng nhập Huyện/Thị xã/Thành phố";
    } else {
      errorDistrict = null;
    }
    notifyListeners();
    return errorDistrict == null;
  }

  bool validateWard() {
    if (user.wardId == null) {
      errorWard = "Vui lòng nhập Phường/Xã";
    } else {
      errorWard = null;
    }
    notifyListeners();
    return errorWard == null;
  }

  bool validateUploadFile() {
    bool isEmptyUpload = true;
    for (var data in listUploadProcess) {
      if (data.imageUrl != null) {
        isEmptyUpload = false;
        break;
      }
    }
    if (isEmptyUpload) {
      errorUploadFile = "Vui lòng chọn tập tin của bạn";
    } else {
      errorUploadFile = null;
    }
    notifyListeners();
    return errorUploadFile == null;
  }
  

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (password.contains(' ')) return "Mật khẩu không được chứa khoảng trắng";
    if (!password.isValidPassword) {
      return 'Mật khẩu không hợp lệ';
    }
    return null;
  }

  String? validateRePassword(String? rePassword) {
    if (rePassword!.isEmpty) {
      return 'Vui lòng nhập lại mật khẩu';
    }
    if (passwordFieldController.text != rePasswordFieldController.text) {
      return 'Mật khẩu không giống nhau';
    }
    return null;
  }

  Future<bool> register() async {
    setLoading = true;
    notifyListeners();
    try {
      if (accountType == Constant.ELDERLY_INDEX) user.roleId = Constant.ELDERLY_ROLE_ID;
      if (accountType == Constant.BUCKLER_INDEX) user.roleId = Constant.BUCKLER_ROLE_ID;
      if (accountType == Constant.MEDICAL_STAFF_INDEX) user.roleId = Constant.MEDICAL_STAFF_ROLE_ID;

      // Chưa đăng nhập lần đầu cần đăng ký
      if(globalApi.existAccountXTM?.exists == false){
        user.xtm = true;
        user.xtmUserId = globalApi.dataUserXTM?.user?.id ?? '';
      }
      else user.xtm = false;

      user.fullName = user.fullName!.formatText;
      listUploadProcess.forEach((element) {
        if (element.imageUrl != null) {
          user.certificates!.add(element.imageUrl??"");
        }
      });
      final response = await repository.register(user);
      setLoading = false;
      notifyListeners();
      if (response.isOk) {
        if(user.xtm == true)
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageScreen(text: 'Bạn đã tích hợp thành công Xã Thông Minh'),));
        return true;
      } else {
        FlushBarUtil.showError(response.message??"");
        return false;
      }
    } catch (e) {
      FlushBarUtil.showError("Lỗi kết nối!");
      setLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> checkPhoneNumber() async {
    setLoading = true;
    notifyListeners();
    try {
      final response = await repository.checkAccount(user.phoneNumber??"");
      setLoading = false;
      notifyListeners();
      if (response.isOk) {
        // DO SOMETHING
        startTimer();
        return true;
      } else {
        FlushBarUtil.showError(response.message??"");
        return false;
      }
    } catch (e) {
      FlushBarUtil.showError("Lỗi kết nối!");
      setLoading = false;
      notifyListeners();
      return false;
    }
  }

  bool checkBackRegisterForm() {
    return phoneFieldController.text.isNotEmpty 
                || nameFieldController.text.isNotEmpty
                || passwordFieldController.text.isNotEmpty
                || rePasswordFieldController.text.isNotEmpty
                || user.provinceId != null
                || user.districtId != null
                || user.wardId != null
                || user.certificates!.isNotEmpty;
  }

  bool checkValidate() {
    bool registerFalse = false;
    // isRegister là kiểm tra có phải đăng ký  thường hay là tích hợp xtm. "true: thường / false : xtm"
    if(isRegister){
      if (!formKey4.currentState!.validate()) {
      registerFalse = true;
      focusRePasswordField.requestFocus();
    }
    if (!formKey3.currentState!.validate()) {
      registerFalse = true;
      focusPasswordField.requestFocus();
    }
    }
    if (!formKey2.currentState!.validate()) {
      registerFalse = true;
      focusPhoneNumberField.requestFocus();
    }
    if (!formKey1.currentState!.validate()) {
      registerFalse = true;
      focusNameField.requestFocus();
    }
    if (!validateProvince()) registerFalse = true;
    if (!validateDistrict()) registerFalse = true;
    if (!validateWard()) registerFalse = true;
    if (errorWard != null) registerFalse = true;
    
    
    if (accountType == Constant.MEDICAL_STAFF_INDEX) {
      if (!validateUploadFile()) registerFalse = true;
    }
    return registerFalse;
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    // h = value ~/ 3600;

    h = 0;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    // String hourLeft =
    //     h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
        m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    // String result = "$hourLeft:$minuteLeft:$secondsLeft";
    String result = "$minuteLeft:$secondsLeft";

    return result;
  }

  bool isPdf(String path) {
    String tail = path.split('.').last;
    return tail.toLowerCase() == "pdf";
  }

  String getFileLength(File file) {
    try {
      int length = file.lengthSync();
      if (length < 1000) {
        return "$length B";
      } else if (length < 1024000) {
        return "${length~/1000} KB";
      } else {
        return "${length~/1024000} MB";
      }
    }catch (e) {
      print(e);
      return "N/A";
    }
  }

  uploadFileSelected(BuildContext context) async {
    try {
      uploadingFile = UploadStatus.PROCESSING;
      notifyListeners();
      final uploadFileBloc = context.read<UploadFileBloc>();
      listUploadProcessSubject.add(listUploadProcess);
      for (var data in listUploadProcess) {
        if (data.sent != null) continue;
        else {
          try {
            await uploadFileBloc.uploadSingleFile(
              data.file,
              onSendProgress: (sent, total) {
                data.sent = sent;
                data.total = total;
                listUploadProcessSubject.add(listUploadProcess);
              }, 
            ).then((file) {
              String path = "${file.currentFolder?.url}${file.fileName}";
              data.imageUrl = path;
              listUploadProcessSubject.add(listUploadProcess);
            });
          } catch (e) {
            data.isError = true;
          }
        }
      }
      uploadingFile = UploadStatus.NONE;
      validateUploadFile();
      notifyListeners();
    } catch (e) {
      print(e);
      uploadingFile = UploadStatus.NONE;
      notifyListeners();
    }
  }

  void removeFile(int index) {
    listUploadProcess.removeAt(index);
    listUploadProcessSubject.add(listUploadProcess);
    notifyListeners();
  }

  void notifyListen() {
    notifyListeners();
  }
}

class UploadProcess {
  final File file;
  int? sent;
  int? total;
  bool? isError;
  String? imageUrl;
  UploadProcess({required this.file});
}

enum UploadStatus { NONE, PENDING, PROCESSING }