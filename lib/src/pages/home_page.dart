import 'package:flutter/material.dart';

import 'package:components/src/providers/menu.dart';

import 'package:components/src/utils/icon_util.dart';
 
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: this._list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _items(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _items(List<dynamic> data, BuildContext context) {
    final List<Widget> list = [];
    data.forEach((option) {
      final widget = ListTile(
        title: Text(option['text']),
        leading: getIcon(option['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          /*final route = MaterialPageRoute(
            builder: (context) => AlertPage()
          );
          Navigator.push(context, route);*/

          Navigator.pushNamed(context, option['route']);
        },
      );
      list..add(widget)
          ..add(Divider());
    });

    return list;
  }
}