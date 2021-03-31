import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddDetail extends StatefulWidget {
  final String phoneNo;
  AddDetail(this.phoneNo);
  @override
  _AddDetailState createState() => _AddDetailState();
}

class _AddDetailState extends State<AddDetail> {
  var _enteredQuantity = 0;
  var _enteredRate = 0;
  var _enteredVariety = '';
  DocumentReference docsId;
  final myControllerQuantity = TextEditingController();
  final myControllerRate = TextEditingController();
  final myControllerVariety = TextEditingController();

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection(widget.phoneNo).add({
      'quantity': _enteredQuantity,
      'rate': _enteredRate,
      'variety': _enteredVariety,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'paise': 0,
      'returnedQuantity':''
    }
    );
    Navigator.of(context).pushReplacementNamed('/DetailScreen',
        arguments: widget.phoneNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Detail'),
      ),
      body: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://assets.ajio.com/medias/sys_master/root/h21/hd4/13040884056094/-1117Wx1400H-440993495-beige-MODEL.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
             
              Expanded(
                child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: myControllerVariety,
                    decoration: InputDecoration(
                        labelText: 'For shirt:s and for lower:l  ....'),
                    // onChanged:
                    onChanged: (value) {
                      setState(() {
                        _enteredVariety = value;
                        print(_enteredVariety);
                      });
                    }),
              ),
              Expanded(
                child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: myControllerQuantity,
                    decoration: InputDecoration(
                        labelText: 'kini shirt leke ja reha...'),
                    // onChanged:
                    onChanged: (value) {
                      setState(() {
                        _enteredQuantity = int.parse(value);
                      });
                    }),
              ),
              Expanded(
                child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: myControllerRate,
                    decoration: InputDecoration(
                      labelText: 'Rate....',
                    ),
                    // onChanged:
                    onChanged: (value) {
                      setState(() {
                        _enteredRate = int.parse(value);
                      });
                    }),
              ),
              RaisedButton(
                onPressed: _sendMessage,
                child: Text('Add'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
