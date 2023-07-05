import 'package:flutter/material.dart';
import 'package:todo_list/app/services/user/user_service.dart';

class LoginController extends ChangeNotifier {
  final UserService _userService;
  LoginController({required UserService userService})
      : _userService = userService;
}

// Aula 201 tempo 5:00 
