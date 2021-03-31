import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailDecoration extends StatefulWidget {
  int quantity;
  int rate;
  String variety;
  int index;
  String userId;
  int paise;
  String phoneNo;
  DetailDecoration(
    this.quantity,
    this.rate,
    this.variety,
    this.index,
    this.userId,
    this.paise,
    this.phoneNo,
  );

  @override
  _DetailDecorationState createState() => _DetailDecorationState();
}

class _DetailDecorationState extends State<DetailDecoration> {
  bool chkIfPressed = false;
  DateTime currentTime = new DateTime.now();
  var enteredPcs = '';
  final myControllerPcs = TextEditingController();
  List listImagesnotFound = [
    "https://img1.exportersindia.com/product_images/bc-full/2019/9/4616123/men-lower-1568283714-5077149.jpeg",
    "https://images-na.ssl-images-amazon.com/images/I/61NiLP4l6JL._UX522_.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // print(widget.index);
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
                listImagesnotFound[widget.variety == 's' ? 1 : 0].toString()),
            title: Text(widget.quantity.toString()),
            subtitle: Text("paise: ${widget.paise}"),
            trailing: Text(DateFormat('yMMMd').format(currentTime).toString() ??
                'variety'),
            isThreeLine: true,
          ),
          TextField(
            controller: myControllerPcs,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Kini aa gayi..',
            ),
            onChanged: (value) {
              setState(() {
                enteredPcs = value;
                if (enteredPcs.trim().length == 0) {
                  widget.paise = 0;
                } else {
                  widget.paise = widget.rate * int.parse(enteredPcs);
                }
                // chkIfPressed = true;
                // Navigator.of(context).pushReplacementNamed('/DetailScreen',
                //     arguments: {
                //       widget.phoneNo,

                //     });
              });
            },
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class NewKhata extends StatefulWidget {
//   @override
//   _NewKhataState createState() => _NewKhataState();
// }

// class _NewKhataState extends State<NewKhata> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 8),
//       padding: EdgeInsets.all(8),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(labelText: "Add Khata"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

/*
Future<String> getdata(DocumentReference docref) async {
                DocumentSnapshot docSnap = await docref.get();
                var docid2 = docSnap.reference.documentID;
                return docid2;
              }

//To retrieve the string
              DocumentReference doc =
                  Firestore.instance.collection(widget.phoneNo).document();
              String documentId = await getdata(doc);
              await Firestore.instance
                  .collection('${widget.phoneNo}')
                  .add({'paise': widget.paise});
              print(documentId);
              */
