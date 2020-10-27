import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cryptocurrencyapp/home_page.dart';

void main() async{ 
  List currencies =await getCurrencies();
  
  print(currencies);
  runApp(new MyApp(currencies));}

class MyApp extends StatelessWidget{
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.dark,),
        home: new HomePage(_currencies),
    );
  }
}

Future<List> getCurrencies() async {
    String cryptoUrl = "https://min-api.cryptocompare.com/data/top/totalvolfull?limit=50&tsym=USD&page=0";
   // http.Response response= await http.get(cryptoUrl);
   var response = await http.get(
      Uri.encodeFull(cryptoUrl),
    );
    List succ;
    var convertDatatoJson = json.decode(response.body);
    succ = convertDatatoJson['Data'];
    return succ;
    //JS.decode(response.body);
  }