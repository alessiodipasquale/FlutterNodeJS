import 'package:flutter/material.dart';
import 'package:FilmsNetwork/colors/colors.dart';
import './../api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'dart:async';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FilmsNetwork',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: backgroundColor,
      ),
      home: Scaffold(
        body: WidgetCreation(),
      ),
    );
  }
}

class WidgetCreation extends StatefulWidget {
  @override
  _WidgetCreationState createState() => _WidgetCreationState();
}

class _WidgetCreationState extends State<WidgetCreation> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _ctrlIp = TextEditingController();

  ApiProvider apiProvider = ApiProvider();
  final success = SnackBar(content: Text('Login riuscito!'));
  final error = SnackBar(content: Text('Credenziali errate!'));
  final serverError = SnackBar(content: Text('Errore nel server!'));



  _saveData() async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();

// set value
    setState((){
      prefs.setString('indirizzo', _ctrlIp.text);

    }
    );
  }

    Future<String> _loadData() async{
    final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it does not exist, return 0.
    final ind = prefs.getString('indirizzo') ?? "";
    return ind;

  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: heigth / 12, left: width / 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Settings",
                            style: new TextStyle(
                                fontFamily: 'Mont',
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          Container(
                            width: width,
                            height: heigth/4,
                            child: Theme(
                              data: new ThemeData(
                                primaryColor: accentColor,
                                primaryColorDark: Colors.blue,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: TextFormField(

                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Inserisci ip!';
                                    }
                                  },


                                  controller: _ctrlIp,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      fontSize: 20.0, color: accentColor),
                                  decoration: new InputDecoration(
                                      labelText: "Ip",
                                      fillColor: accentColor,
                                      prefixIcon: const Icon(
                                        Icons.phone_iphone,
                                        color: Color(0xFF08498A),
                                      ),
                                      border: new OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          borderSide: new BorderSide(
                                              color: Colors.white))),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:58.0),
                            child: Center(
                              child: Theme(
                                data: new ThemeData(
                                  primaryColor: accentColor,
                                  primaryColorDark: Colors.blue,
                                ),
                                child: ButtonTheme(
                                  minWidth: width/2,
                                  height: 40.0,
                                  child: RaisedButton(
                                      onPressed: () {
                                        _saveData();

                                      },
                                      child: const Text('SAVE IP',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'calibre',
                                              letterSpacing: 1.5,
                                              fontSize: 20)),
                                      color: accentColor,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(10.0))),
                                ),
                              ),
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
        ],
      ),
    );
  }
}
