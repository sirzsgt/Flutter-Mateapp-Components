import 'package:flutter/material.dart';

class HomePageTemporal extends StatelessWidget {

  final options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temporal'),
      ),
      body: ListView(
        children: this._createShortItem(),
      ),
    );
  }

  List<Widget> _createItems() {

    List<Widget> list = new List<Widget>();

    for (var option in this.options) {
      final temporalWidget = ListTile(
        title: Text(option),
      );

      list..add(temporalWidget)
          ..add(Divider());
    }

    return list;
  }

  List<Widget> _createShortItem() {
    return this.options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Testing'),
            leading: Icon(Icons.add),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }

}