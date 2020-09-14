import 'package:flutter/material.dart';

import 'dart:async';

class ListViewPage extends StatefulWidget {
  
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastNumber = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    this._addTen();

    this._scrollController.addListener(() {
      if(this._scrollController.position.pixels == this._scrollController.position.maxScrollExtent) {
        this._fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this._scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: Stack(
        children: <Widget>[
          this._createList(),
          this._createLoading()
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: this.getPage,
      child: ListView.builder(
        controller: this._scrollController,
        itemCount: this._listNumbers.length,
        itemBuilder: (BuildContext context, int index) {

          final image = this._listNumbers[index];

          return FadeInImage(
            image: NetworkImage('https://i.picsum.photos/id/$image/350/350.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Future<Null> getPage() async {
    final duration = new Duration(seconds: 2);
     new Timer(duration, () {
      this._listNumbers.clear();
      this._lastNumber++;
      this._addTen();
    });

    return Future.delayed(duration);
  }

  void _addTen() {
    for (var i = 1; i < 10; i++) {
      this._lastNumber++;
      this._listNumbers.add(this._lastNumber);
    }

    setState(() {
      
    });
  }

  Future<Null> _fetchData() async {
    this._isLoading = true;

    final duration = new Duration(seconds: 2);
    new Timer(duration, this._requestHTTP);
  }

  void _requestHTTP() {
    this._isLoading = false;

    this._scrollController.animateTo(
      this._scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );

    this._addTen();
  }

  Widget _createLoading() {
    if(this._isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)  
        ],
      );
    } else {
      return Container();
    }
  }
}