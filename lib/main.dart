import 'package:flutter/material.dart';
import 'secondpage.dart';
import 'third.dart';

void main() {
  runApp(MyApp());
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Coding Excercise"),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: IconButton(
            onPressed: () {
              print("Hello World!");
            },
            icon: Icon(Icons.alarm),
          ),
        ),
      ),
    );
  }
}
*/
//statelessWidget means no refresh while statefulWidget allows the screen to refresh
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffoldApp(),
      // to get the route name just import the file up top and use the class.variable. Then we call the class
      routes: {
        SecondPage.routeName: (_) => SecondPage(),
        ThirdPage.routeName: (_) => ThirdPage(),
      },
    );
  }
}

class MyScaffoldApp extends StatefulWidget {
  @override
  _MyScaffoldAppState createState() => _MyScaffoldAppState();
}

class _MyScaffoldAppState extends State<MyScaffoldApp> {
  bool myNewButton = false;
  String myText = "Hello";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My New Flutter App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        //allows for scrolling
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start, #this positions left to right
          //mainAxisAlignment: MainAxisAlignment.end, #this positions the placement vertically
          //made make multiple rows
          children: [
            //the setstate refreshes the app
            ElevatedButton(
                onPressed: () {
                  //setState(() {
                  //  myNewButton = !myNewButton;
                  //});

                  Navigator.of(context).pushNamed(SecondPage
                      .routeName); //button will now go to the second page
                },
                child: Text("My Button")),
            Container(
              height: 300,
              width: 100,
              color: Colors.indigo,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.end, #position left to right
                //crossAxisAlignment: CrossAxisAlignment.center, # positions top to bottom but doesn't really work for Rows as it needs a container height
                children: [
                  Text(myNewButton ? "This is true" : myText),
                ],
              ),
            ),
            Container(
              // cannot have both color and docoration as color must be inside decoration
              //color: Colors.deepPurple,
              padding: EdgeInsets.all(10), //pads all sides
              margin:
                  EdgeInsets.all(20), //spacing between container and outside
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text("Another Container"),
            ),
            //images
            Image.network(
                "https://numeralpaint.com/wp-content/uploads/2020/08/japan-autumn-season-paint-by-number.jpg"),
            Image.asset(
                "images/download.jpg"), //personal images and need to remove # from assets in pubspec.yaml
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //child: Icon(Icons.home),
        color: Colors.blue,
        child: Row(
          children: [
            Spacer(), // even spacing between the thing coded above and thing coded below
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ThirdPage.routeName);
              },
              icon: Icon(
                Icons.home,
                color: Colors.red,
              ),
            ),
            Spacer(
              flex: 2, //if empty the default is 1 space between everything
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SecondPage.routeName);
              },
              icon: Icon(
                Icons.notifications_active,
                color: Colors.orange,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
