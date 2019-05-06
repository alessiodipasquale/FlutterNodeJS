import 'package:flutter/material.dart';
import './../colors/colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("FilmNetwork",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 20,
                  color: accentColor,
                  fontFamily: 'Mont',
                )),
            Container(
              padding: new EdgeInsets.only(top: 150, left: 50, right: 50),
              child: new Theme(
                data: new ThemeData(
                  primaryColor: accentColor,
                  primaryColorDark: backgroundColor,
                ),
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
                            style:
                                TextStyle(fontSize: 15.0, color: accentColor),
                            decoration: new InputDecoration(
                              labelText: "Enter Email",
                              fillColor: accentColor,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (val) {
                              if (val.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new TextFormField(
                                  obscureText: true,
                                  style: TextStyle(
                                      fontSize: 15.0, color: accentColor),
                                  decoration: new InputDecoration(
                                    labelText: "Enter Password",
                                    fillColor: accentColor,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide:
                                          new BorderSide(color: accentColor),
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val.length == 0) {
                                      return "Email cannot be empty";
                                    } else {
                                      return null;
                                    }
                                  },
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
                                    onPressed: () {},
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
                                            new BorderRadius.circular(10.0))),
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
          ],
        ),
      ),
    );
  }
}
