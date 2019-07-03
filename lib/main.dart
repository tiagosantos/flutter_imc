import 'dart:developer';

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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";
  void _resetField(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
      _formkey = GlobalKey<FormState>();
    });
  }
  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText = "Abaixo do peso. Seu IMC é ${imc.toStringAsPrecision(3)}";
        
      } else if (imc >= 18.6 && imc < 24.9){
        _infoText = "Peso ideal. Seu IMC é ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente acima do peso ideal. Seu IMC é ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 29.9 && imc < 34.9){
        _infoText = "Obesidade Grau I. Seu IMC é ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 34.9 && imc < 39.9){
        _infoText = "Obesidade Grau II. Seu IMC é ${imc.toStringAsPrecision(3)}";
      } else {
        _infoText = "Obesidade Grau III. Seu IMC é ${imc.toStringAsPrecision(3)}";
      }
      
    });
    
  }
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
            onPressed: _resetField,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person_outline, 
                  size: 120, 
                  color: Colors.redAccent[400],
                ),
                TextFormField(
                  controller: weightController,
                  validator: (value){
                    if (value.isEmpty){
                      return "Insira seu peso";
                    }
                  },
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
                TextFormField(
                  controller: heightController,
                  validator: (value){
                    if (value.isEmpty){
                      return "Insira sua altura";
                    }
                  },
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
                        onPressed: (){
                          if (_formkey.currentState.validate()) {
                            _calculate();                            
                          }
                        },
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
                  Text("$_infoText",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.redAccent[400],
                    fontSize: 25,
                  ) 
                  ),
              ],
            ),
          ),
      ),
    );
  }
}