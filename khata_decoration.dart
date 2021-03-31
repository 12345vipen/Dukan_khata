import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KhataDecoration extends StatelessWidget {
  String name;
  String phoneNo;
  int balance;
  int len;
  String userId;

  KhataDecoration(this.name, this.phoneNo, this.balance, this.len, this.userId);
  List listImagesnotFound = [
    "https://cdn0.iconfinder.com/data/icons/user-pictures/100/matureman1-512.png",
    "https://play-lh.googleusercontent.com/8tJpkyUew5IGcCNknc_UDASYig3RLHMtqC9k13ohcIM8R9PiTsJ5mXz4kg0gXMGxgQtK",
    'https://img3.junaroad.com/uiproducts/17524562/pri_175_p-1611934592.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkKSfNzZqnszSFCRb9OZ-XCPMOPoh8ilq1rw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdWAcbFxljxN2L7J-KL4LdNH8qmjKeGT5xEA&usqp=CAU',
    'https://images-na.ssl-images-amazon.com/images/I/41iY8TjlLdL.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    print(len);
    return InkWell(
      splashColor: Colors.red[900],
      highlightColor: Colors.deepPurpleAccent,
      // splashFactory: ,
      onTap: () => Navigator.of(context)
          .pushNamed('/DetailScreen', arguments: phoneNo),

      child: Card(
        child: ListTile(
          leading: Image.network(listImagesnotFound[
                  len < listImagesnotFound.length
                      ? len
                      : len % listImagesnotFound.length]
              .toString()),
          title: Text(name),
          subtitle: Text('Balance: Rs $balance'),
          trailing: IconButton(
            icon: Icon(Icons.phone),
            onPressed: () => launch("tel:$phoneNo"),
          ),
          isThreeLine: true,
        ),
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
