import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  static const routeName = "third";

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController _controller = TextEditingController();
  String userInput = "Write";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to the third page all about center widget"),
      ),
      body: Column(children: [
        Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.cyan,
              child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      userInput = _controller.text;
                    });
                  },
                  child: Text(
                    "Display",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  )),
            )), //just makes how much space is made for the child so if a row widget is required then a container with a height is required
        Expanded(
          flex: 2,
          child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey,
              child: TextFormField(
                controller: _controller,
              )),
        ),
        Expanded(
            child: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    userInput,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ))),
        /*
        Container(
            child: Row(children: [
          Expanded(child: Container(color: Colors.amber)),
          Expanded(child: Container(color: Colors.blue)),
          Expanded(child: Container(color: Colors.blueGrey)),
          Expanded(child: Container(color: Colors.orange)),
        ])),*/
      ]),
      /*Center(
          child: Text(
              "Welcome to the third page")), //put widgets in the center of whatever
*/
    );
  }
}
