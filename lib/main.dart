import 'package:Covid19_PH/ui/views/home/home_view.dart';
import 'package:Covid19_PH/widgets/search_bar_widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Master(),
    );
  }
}

class Master extends StatefulWidget {
  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(),
      body: Container(
        child: Home(),
      ),
    );
  }
}
