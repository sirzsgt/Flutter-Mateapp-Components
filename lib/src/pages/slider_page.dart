import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  bool _blocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            this._createSlider(),
            this._createCheckbox(),
            this._createSwitch(),
            Expanded(
              child: this._createImage(),
            )
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Size',
      value: this._sliderValue,
      min: 10,
      max: 400,
      onChanged: (this._blocked) ? null : (value) {
        setState(() {
          this._sliderValue = value;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQG1GyhB65dkhLMDZue8i6-mcUaoRjqlgdwzgC_EHgwl452j3ME&usqp=CAU'),
      width: this._sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
      title: Text('Block Slider'),
      value: this._blocked,
      onChanged: (value) {
        setState(() {
          this._blocked = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Block Slider'),
      value: this._blocked,
      onChanged: (value) {
        setState(() {
          this._blocked = value;
        });
      },
    );
  }
}