import 'package:flutter/material.dart';
import './../colors/colors.dart';
import '../token_service.dart';
import 'dart:convert';
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  var nome;
  var cognome;
  
  @override
  void initState() {
    super.initState();
    getTokenData();
 }

 getTokenData() async{
   TokenService tokenService = new TokenService();
   tokenService.getDecodedToken()
   .then( (decodedToken) => {
     this.nome = decodedToken["name"],
     this.cognome = decodedToken["surname"],
    }
   );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Benvenuto \n $nome $cognome!', style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Mont',
                  fontSize: 25
                ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}