import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import './../colors/colors.dart';
import './../api_provider.dart';
import './../pages/home.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FilmsNetwork',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: backgroundColor,
      ),
      home: Scaffold(
        body: BodyWidget(),
      ),
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
  TextEditingController _crtlEmail = TextEditingController();
  TextEditingController _crtlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ApiProvider apiProvider = ApiProvider();

  Future doLogin() async {
    if (_formKey.currentState.validate()) {
      try {
        var res =
            await apiProvider.doLogin(_crtlEmail.text, _crtlPassword.text);
        if (res.statusCode == 200) {
          var jsonRes = json.decode(res.body);
          var token = jsonRes['token'];
          print(token);
          // TOKEN DA SALVARE NEGLI SHARED PREF

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          print(res.statusCode);
        }
      } catch (err) {
        print(err);
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text("FilmsNetwork",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 20,
                      color: accentColor,
                      fontFamily: 'Mont',
                    )),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text("All the cinema in your pocket!",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: 15,
                        color: accentColor,
                        fontFamily: 'calibre',
                      )),
                ),
                Container(
                  color: Colors.transparent,
                  child: SizedBox(

                  )
                ),
                Container(

                  padding: new EdgeInsets.only(top: 150, left: 50, right: 50),
                  child: new Theme(
                    data: new ThemeData(
                      primaryColor: accentColor,
                      primaryColorDark: backgroundColor,
                    ),

                    child: Card(
                      elevation: 4.0,
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      child: Container(
                        padding: new EdgeInsets.all(30.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Inserisci email!';
                                      }
                                    },
                                    controller: _crtlEmail,
                                    style: TextStyle(
                                        fontSize: 15.0, color: accentColor),
                                    decoration: new InputDecoration(
                                      labelText: "Enter Email",
                                      fillColor: accentColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        new TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Inserisci password!';
                                            }
                                          },
                                          controller: _crtlPassword,
                                          obscureText: true,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: accentColor),
                                          decoration: new InputDecoration(
                                            labelText: "Enter Password",
                                            fillColor: accentColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: ButtonTheme(
                                        minWidth: 200.0,
                                        height: 50.0,
                                        child: RaisedButton(
                                            onPressed: () => doLogin(),
                                            child: const Text('LOGIN',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'calibre',
                                                    letterSpacing: 1.5,
                                                    fontSize: 20)),
                                            color: accentColor,
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        10.0))),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child:
                                          Text("Non sei registrato?Clicca qui",
                                              textAlign: TextAlign.center,
                                              style: new TextStyle(
                                                fontSize: 13,
                                                color: accentColor,
                                                fontFamily: 'calibre',
                                                decoration:
                                                    TextDecoration.underline,
                                              )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}
