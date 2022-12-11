import 'package:contact_app/DB/repo.dart';
import 'dart:async';

import 'package:contact_app/models/AddUser.dart';

class UserService {
  late Repository _repository;

//constructor
  UserService() {
    _repository = Repository();
  }
// Saving the user
  SaveUser(User user) async {
    return await _repository.insertData('users', user.userMap());
  }

  // read users
  readAllUsers() async {
    return await _repository.readData('users');
  }

  //Edit User
  UpdateUser(User user) async {
    return await _repository.updateData('users', user.userMap());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('users', userId);
  }
}
