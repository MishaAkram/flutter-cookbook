import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_app_learning/NavDrawer.dart';
void main()
{
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}
 
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
              SliverAppBar(
                expandedHeight: 220.0,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Codesinsider.com",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                      )),
                    background:Image.asset("assets/images/flutter_stack.jpg", fit: BoxFit.cover,),
                    ),
              ),
              ];
            },
          body: Center(
            child: Text(
              "This is body", 
              style: TextStyle(
                  color: Colors.black
              ), 
            ),
          ),
        ),
    );
  }
}