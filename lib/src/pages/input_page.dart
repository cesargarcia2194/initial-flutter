import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name ='';
  String _email ='';
  String _date = '';
  String _optionSelected = 'Volar';
  List<String> _listPower = ['Volar', 'Rayos X', 'Super aliento'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs de texto')),
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson()
        ],
      )
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('letras ${_name.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value){
        setState(() {
          _name = value;
        });
      },
    );
  }
  
  Widget _createEmail() {
    return TextField(
      //autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Correo electronico',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (value){
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      //autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'pasword',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (value){
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha nacimiento',
        labelText: 'Fecha nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }
  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if(picked != null){
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown(){
    List<DropdownMenuItem<String>> list = [];
    _listPower.forEach((el) {
      list.add(DropdownMenuItem(
        child: Text(el),
        value: el,
      ));
    });
    
    return list;
  }

  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _optionSelected,
            items: getOptionsDropdown(),
            onChanged: (opt){
              setState(() {
                _optionSelected = opt;
              });
            },
          ) 
        )
      ],
    );
  }

  Widget _createPerson(){
    return ListTile(
      title: Text('Nombre es $_name'),
      subtitle: Text('$_email'),
      trailing: Text('Puede: $_optionSelected'),
    );
  }
}