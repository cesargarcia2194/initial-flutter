import 'package:flutter/material.dart';


class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _listNumber = [1,2,3,4,5,6,7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista')
      ),
      body: _createList(),
    );
  }

  Widget _createList(){
    return ListView.builder(
      itemCount: _listNumber.length,
      itemBuilder: (BuildContext context, int index){
        final image = _listNumber[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/id/$image/500/300'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      }
    );
  }
}