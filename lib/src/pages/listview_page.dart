import 'dart:async';
import 'package:flutter/material.dart';


class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  ScrollController _scrollController = new ScrollController();
  List<int> _listNumber = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();
    _scrollController.addListener((){
      if(_scrollController.position.pixels ==
      _scrollController.position.maxScrollExtent){
        //_add10();
        _fetchData();
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista')
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ],
      )
    );
  }

  Widget _createList(){
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumber.length,
        itemBuilder: (BuildContext context, int index){
          final image = _listNumber[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$image/500/300'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        }
      ), 
      onRefresh: _getPageOne
    );
  }
  void _add10(){
    for(var i=1; i<=10; i++){
      _lastItem++;
      _listNumber.add(_lastItem);
    }
    setState(() {});
  }

  Future _fetchData() async{
    _isLoading = true;
    setState((){});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, httpResponse);
  }
  void httpResponse(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      curve: Curves.fastOutSlowIn,
      duration: new Duration(milliseconds: 300)
    );
    _add10();
  }

  Widget _createLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 20.0)
        ]
      );
    }else{
      return Container();
    }
  }
  Future<void> _getPageOne() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listNumber.clear();
      _lastItem++;
      _add10();
    });
    return Future.delayed(duration);
  }
}