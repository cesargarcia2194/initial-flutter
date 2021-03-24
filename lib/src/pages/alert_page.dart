import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar alerta'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey,
            textStyle: TextStyle(color: Colors.white)
          ),
          onPressed: ( )=>_showAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
  void _showAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Center(child: Text('Titulo')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido'),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: ()=>Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}