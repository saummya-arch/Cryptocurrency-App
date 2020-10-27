import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  final List currencies;
 
  HomePage(this.currencies);
  @override 
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List currencies;
  final List<MaterialColor> _colors  = [Colors.blue,Colors.indigo,Colors.teal];

  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CryptoApp"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget(){
    return new Container(
      child: new Column(
        children:<Widget>[new Flexible(
          child: new ListView.builder(
            itemCount: widget.currencies.length,
            itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color= _colors[index % _colors.length];

                return _getListItemUi(currency,color);
            },
          ),
        )
        ],
      )
    );
  }

  ListTile _getListItemUi(Map currency,MaterialColor color){
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency['CoinInfo']['Name'][0]),
      ),
      title: new Text(
        currency['CoinInfo']['Name'],
        style: new TextStyle(fontWeight: FontWeight.bold),
        ),
       subtitle: new Text(currency['CoinInfo']['FullName']),
    );
  }
}