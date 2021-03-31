import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukan_app/widgets/khata/detail_decoration.dart';
import 'package:dukan_app/widgets/khata/khata_decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllDetail extends StatelessWidget {
  String phoneNo;
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
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) =>
                      // if (chkIfPressed == true) {
                      //   Firestore.instance
                      //       .collection(phoneNo)
                      //       .document(chatDocs[indexUpdate].documentID)
                      //       .updateData({'paise': paised});
                      // }
                      DetailDecoration(
                        chatDocs[index]['quantity'],
                        chatDocs[index]['rate'],
                        chatDocs[index]['variety'],
                        index,
                        chatDocs[index]['userId'],
                        chatDocs[index]['paise'],
                        phoneNo,
                        chatDocs,
                        chatDocs[index]['returnedQuantity'],
                      ));
            });
      },
    );
  }
}

// chatDocs[index]['userId'] == futureSnapshot.data.uid,
