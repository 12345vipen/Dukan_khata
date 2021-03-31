import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukan_app/widgets/khata/all_detail.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String phoneNo;
 
  DetailScreen(
    this.phoneNo,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Welcome'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: AllDetail(phoneNo)),
            // Expanded(
            //   child: Container(
            //     child: Center(
            //       child: Text("$phoneNo"),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed('/AddDetail', arguments: phoneNo);
                },
                child:
                    const Text('Daily Enrty!', style: TextStyle(fontSize: 20)),
                color: Colors.black,
                textColor: Colors.white,
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
