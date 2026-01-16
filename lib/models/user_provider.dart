import 'package:flutter/widgets.dart';
import 'package:flutter_base_architecture/models/user/user.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  UserProvider(this.user);

  set updateUser(User? user) {
    this.user = user;
    notifyListeners();
  }
}
