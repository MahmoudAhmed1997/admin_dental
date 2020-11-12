import 'package:flutter/material.dart';

class PatientDataItem extends StatelessWidget {
  final String id;
  final String name;
  final int phone;
  final int age;
  final String note;
  final String procedure;

  PatientDataItem(
      this.id, this.name, this.phone, this.age, this.note, this.procedure);
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround ,
              children: <Widget>[
                Text(
                  "PatientName:",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                Text(
                  "$name",
                  style: TextStyle(color: Colors.red, fontSize: 30.0),
                ),
              ],
            ),Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround ,
              children: <Widget>[
                Text(
                  "PhoneNumber",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                Text(
                  "$phone",
                  style: TextStyle(color: Colors.red, fontSize: 30.0),
                ),
              ],
            ),Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround ,
              children: <Widget>[
                Text(
                  "Age",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                Text(
                  "$age",
                  style: TextStyle(color: Colors.red, fontSize: 30.0),
                ),
              ],
            ),Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround ,
              children: <Widget>[
                Text(
                  "Notes",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                Text(
                  "$note",
                  style: TextStyle(color: Colors.red, fontSize: 30.0),
                ),
              ],
            ),Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround ,
              children: <Widget>[
                Text(
                  "Prosedure",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                Text(
                  "$procedure",
                  style: TextStyle(color: Colors.red, fontSize: 30.0),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
