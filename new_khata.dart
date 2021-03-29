import 'package:flutter/material.dart';

class NewKhata extends StatefulWidget {
  @override
  _NewKhataState createState() => _NewKhataState();
}

class _NewKhataState extends State<NewKhata> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: "Add Khata"),
            ),
          )
        ],
      ),
    );
  }
}
