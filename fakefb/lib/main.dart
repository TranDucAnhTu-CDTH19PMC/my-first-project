import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'page/home.dart';
import 'page/friend.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Facebook'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



Container _Notifi() {
  return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: EdgeInsets.fromLTRB(8, 4, 20, 8),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'images/avt.jpeg',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Người yêu của tú",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ],
              ))
        ],
      ));
}

Container _Notifis() {
  return Container(
      color: Colors.grey.shade800,
      child: ListView(
        children: [
          _Notifi(),
          _Notifi(),
          _Notifi(),
          _Notifi(),
          _Notifi(),
          _Notifi(),
          _Notifi(),
          _Notifi(),
          _Notifi(),
        ],
      ));
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unnecessary_new
  Widget post = new posts();
  Widget friend = new friends();
  Widget notifi = _Notifis();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar:PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.grey.shade800,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.mobile_friendly_outlined)),
                Tab(icon: Icon(Icons.add_to_queue)),
                Tab(icon: Icon(Icons.gamepad)),
                Tab(icon: Icon(Icons.notifications)),
                Tab(icon: Icon(Icons.menu)),
              ],
            ),
            title: Text(widget.title, style: TextStyle(fontSize: 24),textAlign: TextAlign.left,),
          ),
          ),
          body: TabBarView(
            children: [
              post,
              friend,
              post,
              post,
              notifi,
              Icon(Icons.directions_bike),
            ],
          ),
        ));
  }
}
