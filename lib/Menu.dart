import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var menu = [
      'Announcements',
      'Lectures Today',
      'Attendance',
      'Assignments',
      'Result',
      'Exam Available'
    ];
    var menuIcons = [
      "photo/announcement.jpg",
      "photo/lecture.png",
      "photo/calendar.png",
      "photo/assignments.png",
      "photo/briefcase.png",
      "photo/exams.png",
    ];
    var hoverNumber = ['38','5','99%','45','9.64','8'];

    return Container(
      color: Colors.white10,
      height: MediaQuery.of(context).size.height * 0.56,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.54,
          children: List<Widget>.generate(6, (index) {
            return GridTile(
              child: Stack(
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.only(left: 6.0, top: 10.0),
                    clipBehavior: Clip.antiAlias,
                    elevation: 11.0,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          4.0,
                        ),
                        borderSide: BorderSide(color: Colors.transparent)),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.47,
                      height: MediaQuery.of(context).size.height * 0.16,
                      color: Colors.cyan[900],
                    ),
                  ),
                  Positioned(
                    right: 7.0,
                    top: 20.0,
                    child: Container(
                      width: (index==2 || index == 4)? 52.0:36.0,
                      height: 22.0,
                      color: Colors.orange[800],
                      child: Center(
                        child: Text(
                          hoverNumber[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      menuIcons[index],
                      height: 50.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        menu[index],
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
