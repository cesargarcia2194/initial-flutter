import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {
  final options = ['uno','dos', 'Tres', 'Four'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('dasdasd'),
        ),
        body: ListView(
          children: _createItemShort()
        )
      );
  }
  
  List<Widget> _createItemShort(){
    return options.map((e){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(e),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ]
      );
    }).toList();
  }
}
