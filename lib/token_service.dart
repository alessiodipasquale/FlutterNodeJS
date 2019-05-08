import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  TokenService();

  getDecodedToken() async {
    final prefs = await SharedPreferences.getInstance();
    final hidedToken = prefs.getString('token') ?? "";
  }
}