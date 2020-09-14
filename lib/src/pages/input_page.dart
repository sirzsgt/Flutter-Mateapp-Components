import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _date = '';

  List<String> _powers = ['Fly', 'X Rays', 'Super Wind', 'Super Strength'];

  String _selectedOption = 'Fly';

  TextEditingController _inputFielDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        children: <Widget>[
          this._createInput(),
          Divider(),
          this._createEmail(),
          Divider(),
          this._createPassword(),
          Divider(),
          this._createDate(context),
          Divider(),
          this._createPerson(),
          Divider(),
          this._createDropDown()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      onChanged: (value) {
        setState(() {
          this._name = value;
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        counter: Text('Letras ${this._name.length}'),
        hintText: 'Name',
        labelText: 'Name',
        helperText: 'Just person name',
        suffix: Icon(Icons.person),
        icon: Icon(Icons.account_circle)
      ),
    );
  }

  Widget _createEmail() {
    return TextField(
      onChanged: (value) {
        setState(() {
          this._email = value;
        });
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: 'E-Mail',
        labelText: 'E-Mail',
        suffix: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
    );
  }

  Widget _createPassword() {
    return TextField(
      onChanged: (value) {
        setState(() {
        });
      },
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: 'Password',
        labelText: 'Password',
        suffix: Icon(Icons.remove_red_eye),
        icon: Icon(Icons.lock)
      ),
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('My name is ${this._name}'),
      subtitle: Text('E-Mail: ${this._email}'),
      trailing: Text(this._selectedOption),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: this._inputFielDateController,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        this._selectedDate(context);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: 'Date',
        labelText: 'Date',
        suffix: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
    );
  }

  _selectedDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2030),
      locale: Locale('es', 'MX')
    );

    if (picked != null) {
      setState(() {
        this._date = picked.toString();
        this._inputFielDateController.text = this._date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = new List();
    this._powers.forEach((power) {
      list.add(
        DropdownMenuItem(
          child: Text(power),
          value: power,
        )
      );
    });

    return list;
  }

  Widget _createDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 20),
        Expanded(
          child: DropdownButton(
            items: this.getDropdownOptions(),
            onChanged: (option) {
              setState(() {
                this._selectedOption = option;
              });
            },
          ),
        )
      ],
    );
  }
}
