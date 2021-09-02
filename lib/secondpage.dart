import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  static const routeName = 'second_page';

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Another flutter page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      number += 1;
                    });
                  },
                  child: Text("Add new Item")),
              ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return ListTile(
                    tileColor: index.isEven ? Colors.green : Colors.amber,
                    title: Text("My Tile"),
                    subtitle: Text("subtitle"),
                    leading: Icon(Icons.date_range),
                    trailing: Icon(Icons.developer_mode),
                  );
                },
                itemCount: number,
              ),
            ],
          ),
        ));
  }
}
