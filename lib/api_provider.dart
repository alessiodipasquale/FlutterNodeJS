import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {

  ApiProvider();

  Future <http.Response> doLogin(String email, String password) async {
    String ip = '192.168.1.72';
    String _url = 'http://$ip:3000/login';

    var body = {
      "email": email,
      "password": password
    };


    return http.post(_url, body: body);
  }
}

