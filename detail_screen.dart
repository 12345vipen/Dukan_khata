import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // final String name;
  // final String userId;
  // DetailScreen({this.name, this.userId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'),
      ),
      body: Center(
        child: Text('Hale kar reha!'),
      ),
    );
  }
}
