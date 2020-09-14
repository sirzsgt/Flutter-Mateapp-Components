import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    
  }

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('data/menu_opts.json');
    Map datamap = json.decode(response);
    options = datamap['routes'];

    return options;
  }
}

final menuProvider = new _MenuProvider();