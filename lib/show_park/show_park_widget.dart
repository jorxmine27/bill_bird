import 'package:bill_bird/components/show_park_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowParkWidget extends StatefulWidget {
  const ShowParkWidget({Key? key}) : super(key: key);

  @override
  _ShowParkState createState() => _ShowParkState();
}

class _ShowParkState extends State<ShowParkWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Nombre del Parque')
      ),
      body: Container(

      ),
    );
  }

}