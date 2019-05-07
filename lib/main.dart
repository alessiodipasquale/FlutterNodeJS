import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './pages/login.dart';
import './colors/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Node server demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: accentColor,
      ),
      home: Login()
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  BodyWidgetState createState() {
    return new BodyWidgetState();
  }
}

class BodyWidgetState extends State<BodyWidget> {
  String serverResponse = 'Server response';
  String ip;
  
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (text) { 
                  ip = text;
                },
              ),
              RaisedButton(
                child: Text('Send request to server'),
                onPressed: () {
                  _makeGetRequest();

                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(serverResponse),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _makeGetRequest() async {
    Response response = await get(_localhost(ip));
    setState(() {
      serverResponse = response.body;
      _changePage();
    });

  }
  _changePage() => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()));

  String _localhost(String iptext) {
    if (Platform.isAndroid)
      return 'http://$iptext:3000/login';
    else // for iOS simulator
      return 'http://$iptext:3000/login';
  }
}