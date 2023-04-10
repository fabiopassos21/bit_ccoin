import'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'dart:async';
void main (){
  runApp(MaterialApp(
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  String br;
  String resultado = "RESULTADO";
  RecuperarValor () async {

    String url = "https://blockchain.info/ticker";
    http.Response response  = await http.get(url);
    Map<String,dynamic> retorno = json.decode(response.body);
   print ("resultado " + retorno["BRL"]["buy"].toString());


    setState(() {
      resultado = retorno["BRL"]["buy"].toString();

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("ACABOU A LIBERDADE !!"),
      ),

      body: Container(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
          Padding(padding: EdgeInsets.all(20),child:
          Image.asset("imagens/bitcoin.png")
            ,),
            Text(" R\$ "+ resultado,style: TextStyle(
              fontSize: 30

            ),),
            RaisedButton(onPressed:RecuperarValor,
           color: Colors.orange,
            child: Text("Atualizar",style:
              TextStyle(
                fontSize: 20,
                color: Colors.white,

                
              ),),
            )

          ],
          
        ),

      ),

    );
  }
}
