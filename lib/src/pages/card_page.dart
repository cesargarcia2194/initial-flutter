import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card')),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTypeOne(),
          SizedBox(height:30.0),
          _cardTypeTwo()
        ],
      ),
    );
  }

  _cardTypeOne() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text('dmañlk añlksdñka kñk ñakñ lks kñsd kaskda sañ d{a{da {ñl ldklña mlñkm ,mlkalm ñlklña l l kñlakdsm,amsdñ'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'), onPressed: (){} ),
              TextButton(
                child: Text('Ok'), onPressed: (){})
            ],
          )
        ],
      ) 
    );
  }

  _cardTypeTwo() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg'),
            fadeInDuration: Duration(milliseconds: 500),
          ),
          //Image(image: NetworkImage('https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg')),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Algo va aqui')
          )
        ]
      ),
    );
  }
}