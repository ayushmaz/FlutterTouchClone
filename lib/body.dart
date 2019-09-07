import 'package:flutter/material.dart';
import 'package:ums_touch/Menu.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _subjects = ['CSE316', "CSE408", 'INT404', 'CSE325', 'CSE325'];

  var _time = ['01-02 PM', '02-03 PM', '03-04 PM', '04-05 PM', '05-06 PM'];

  var _roomNo = ['34-503', '34-102', '34-102', '34-301', '34-301'];

  bool status = false;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 16.0, color: Colors.white);

    var textStyle1 = TextStyle(fontSize: 16.0, color: Colors.grey[700]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.20,
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Today's Timetable", style: textStyle1),
              Padding(padding: EdgeInsets.all(4.0)),
              Expanded(
                child: ListView.builder(
                  itemCount: _subjects.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 7.0,
                      clipBehavior: Clip.antiAlias,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.transparent
                        )
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: 170.0,
                              height: 20.0,
                              color: Colors.cyan[900],
                              child: Center(
                                child: Text(
                                  _time[index],
                                  style: textStyle,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                child: Text(
                                  _subjects[index],
                                  style: textStyle1,
                                ),
                                padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                              ),
                          ),

                          Expanded(
                            child: Text(
                              "Room No: ${_roomNo[index]}",
                              style: textStyle1,
                            ),
                          ),

                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(top:2.0),
                                child: Text(
                                  status == false? "Upcoming":"Present" ,
                                  style: TextStyle(color: status == false? Colors.orange[800]: Colors.green , fontSize: 16.0 , fontFamily: 'Raleway'),
                                ),
                              ),
                          ),


                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Menu(),
      ],
    );
  }
}
