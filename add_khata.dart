import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddKhata extends StatefulWidget {
  @override
  _AddKhataState createState() => _AddKhataState();
}

class _AddKhataState extends State<AddKhata> {
  var _enteredName = '';
  var _enteredPhoneNo = '';
  var _enteredBalance = 0;
  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('khata').add({
      'name': _enteredName,
      'phoneNo': _enteredPhoneNo,
      'balance': _enteredBalance,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
    });
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Khata'),
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
        ],
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
              Expanded(
                child: TextField(
                    decoration: InputDecoration(labelText: 'Karigar name...'),
                    // onChanged:
                    onChanged: (value) {
                      setState(() {
                        _enteredName = value;
                      });
                    }),
              ),
              Expanded(
                child: TextField(
                    decoration: InputDecoration(labelText: 'Phone no....'),
                    // onChanged:
                    onChanged: (value) {
                      setState(() {
                        _enteredPhoneNo = value;
                      });
                    }),
              ),
              Expanded(
                child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Current Balance....',
                    ),
                    // onChanged:
                    onChanged: (value) {
                      setState(() {
                        _enteredBalance = int.parse(value);
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
