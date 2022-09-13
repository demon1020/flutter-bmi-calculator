import 'package:bmi/repository/user_data_repository.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class UserDetailProvider extends ChangeNotifier{

  late User user;

  init() async {
    user = await fetchUser();
  }

  fetchUser() async {
    User _user = await UserRepository().getUser();
    user = _user;
    notifyListeners();
  }

  addUser(User user) async {
    await UserRepository().addUser(user);
    notifyListeners();
  }

}