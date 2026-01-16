import 'package:flutter_base_architecture/preference/preference.dart';
import 'package:flutter_base_architecture/repository/repository.dart';

class UserRepository extends Repository {

  Future<bool> logout() async {
    return PreferenceManager.setString(PreferenceManager.KEY_ACCESS_TOKEN, '');
  }


}
