import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline, 
              size: 120, 
              color: Colors.redAccent[400],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso (kg)",
                labelStyle: TextStyle(
                  color: Colors.redAccent[400]
                  )
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.redAccent[400],
                fontSize: 25,
                ),
              ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.redAccent[400])
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.redAccent[400],
                fontSize: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("Calcular", 
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 25
                                ),
                            ),
                    color: Colors.redAccent[400]
                  ),
                ),
                ),
              Text("Info",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.redAccent[400],
                fontSize: 25,
              ) 
              ),
          ],
        ),
      ),
    );
  }
}