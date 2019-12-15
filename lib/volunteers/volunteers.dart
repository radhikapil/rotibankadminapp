import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Volunteers extends StatefulWidget {
  @override
  _VolunteersState createState() => _VolunteersState();
}

class _VolunteersState extends State<Volunteers> {
  @override
  Widget build(BuildContext context) {
    var ref =
        FirebaseDatabase.instance.reference().child('VolunteerRegistration');
    return SafeArea(
      child: Align(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          width: 0.92 * MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Volunteers',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 26.0),
              ),
              SizedBox(height: 20.0),
              StreamBuilder(
                stream: ref.onValue,
                builder: (context, snap) {
                  if (snap.hasData &&
                      !snap.hasError &&
                      snap.data.snapshot.value != null) {
                    DataSnapshot snapshot = snap.data.snapshot;
                    List item = [];
                    List _list = [];
                    _list = snapshot.value;
                    _list.forEach((f) {
                      if (f != null) {
                        item.add(f);
                      }
                    });
                    return snap.data.snapshot.value == null
                        ? SizedBox()
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: item.length,
                            itemBuilder: (context, index) {
                              return Container(child: Text(item[index]['name']));
                            },
                          );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
