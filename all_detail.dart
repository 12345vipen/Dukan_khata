import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukan_app/widgets/khata/detail_decoration.dart';
import 'package:dukan_app/widgets/khata/khata_decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllDetail extends StatelessWidget {
  String phoneNo;
  int totalBalance = 0;
  // int indexUpdate;
  // bool chkIfPressed;
  // String paised;
  AllDetail(this.phoneNo);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return StreamBuilder(
            stream: Firestore.instance
                .collection(phoneNo)
                .orderBy(
                  'createdAt',
                )
                .snapshots(),
            builder: (context, chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final chatDocs = chatSnapshot.data.documents;

              return ListView.builder(
                  // reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) => DetailDecoration(
                        chatDocs[index]['quantity'],
                        chatDocs[index]['rate'],
                        chatDocs[index]['variety'],
                        index,
                        chatDocs[index]['userId'],
                        chatDocs[index]['paise'],
                        phoneNo,
                        chatDocs,
                        chatDocs[index]['returnedQuantity'],
                        totalBalance,
                      ));
            });
      },
    );
  }
}

// chatDocs[index]['userId'] == futureSnapshot.data.uid,
