import 'package:flutter/material.dart';
import 'package:ums_touch/body.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ums",
      theme: ThemeData(
        fontFamily: "Raleway-Regular",
      ),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var textStyle = TextStyle(
    fontSize: 24.0, fontFamily: "Raleway-Regular", color: Colors.black);

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var drawerList = [
      'Admission Enquiry',
      'Announcements',
      'Assignment Marks',
      'Attendance',
      'Barcode Scanner',
      'Campus Tour',
      'Certificate Request',
      'Change UMS Password',
      'Doctor Appointment',
      'Events',
      'Fee Payment',
      'Fee Statement',
      'Gallery'
    ];
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Dashboard",
          style: textStyle,
        ),
        actions: <Widget>[],
        leading: Builder(
            builder: (context) => IconButton(
                  icon: Image.asset(
                    "photo/ham_icon.png",
                    height: 30.0,
                  ),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                )),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.cyan[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage("photo/niharika.JPG"),
                ),
                Text(
                  "Niharika",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "11702387",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "P132:B.Tech.(Computer Science & Engineering)",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 18.0,
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Text(
                      "View Profile",
                      style: TextStyle(color: Colors.cyan[900], fontSize: 12.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40.0,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: "Search",
                          contentPadding: EdgeInsets.only(top: 8.0),
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(2.0),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.57,
            child: ListView.builder(
              itemCount: drawerList.length,
              itemBuilder: (BuildContext context,int index){
                return Column(
                  children:[
                    ListTile(
                    title: Text(drawerList[index] , style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                      fontFamily: 'Raleway-Regular'
                    ),),
                      contentPadding: EdgeInsets.only(top: 4.0,left: 15.0),
                  ),
                    Divider(
                      color: Colors.grey[600],
                    )

                  ]
                );
              },
            ),

          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.0685,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: FlatButton(
                    color: Colors.cyan[900],
                    child: Text('Rate Us'),
                    onPressed: (){},
                    textColor: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: FlatButton(
                    color: Colors.orange[800],
                    onPressed: (){},
                    child: Text('Logout'),
                    textColor: Colors.white,

                  ),
                )
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: TabBar(
        labelColor: Colors.orange,
        indicatorColor: Colors.white,
        controller: tabController,
        tabs: <Widget>[
          Tab(
              icon: Image.asset(
                "photo/dashboard1.png",
                height: 32.0,
                width: 32.0,
              ),
              text: "Dashboard"),
          Tab(
            icon: Image.asset(
              "photo/newspaper.png",
              height: 36.0,
              width: 40.0,
            ),
            text: "Happening",
          ),
          Tab(
            icon: Image.asset(
              "photo/edit.png",
              height: 32.0,
              width: 32.0,
            ),
            text: "RMS",
          ),
          Tab(
            icon: Image.asset(
              "photo/list.png",
              height: 36.0,
              width: 36.0,
            ),
            text: "Quick Quiz",
          ),
        ],
      ),
      body: TabBarView(
        children: <Widget>[
          Body(),
          Body(),
          Body(),
          Body(),
        ],
        controller: tabController,
      ),
    );
  }
}
