
import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blockCheck = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitc(),
            Expanded( 
              child: _createImage()
            )
          ],
        ),
      ),
    );
  }

  _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño imagen',
      value: _valueSlider,
      min: 10.0,
      max:400.0,
      onChanged: (_blockCheck) ? null : (value)=>setState(() {_valueSlider=value;}) 
    );
  }

  Widget _createImage() {
    return Image(
        image: NetworkImage('https://sm.ign.com/ign_latam/screenshot/default/goku-susanoo_7by3.jpg'),
        width: _valueSlider,
        fit: BoxFit.contain
      );
  }

  Widget _createCheckbox() {
    //return Checkbox(
    //  value: _blockCheck, 
    //  onChanged: (value){
    //    setState(() {
    //      _blockCheck = value;
    //    });
    //  }
    //);
    return CheckboxListTile(
      value: _blockCheck,
      title: Text('Bloquear slider'),
      onChanged: (value){
        setState(() {
          _blockCheck = value;
        });
      }
    );
  }

  _createSwitc() {
    return SwitchListTile(
      value: _blockCheck,
      title: Text('Bloquear slider'),
      onChanged: (value){
        setState(() {
          _blockCheck = value;
        });
      }
    );
  }
}