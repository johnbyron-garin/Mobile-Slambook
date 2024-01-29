import 'package:flutter/material.dart';

class DescriptionRoute extends StatelessWidget {
  static const routename = '/description';
  final String? title;
  final Map? message;

  const DescriptionRoute({super.key, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('SlamBook'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Friends'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text(title!)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.person),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text("Name:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 107),
                child: Text(message!["Name"]),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text("Nickname:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text(message!["Nickname"]),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text("Age:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 120),
                child: Text(message!["Age"]),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text("Relationship Status:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 21),
                child: Text(message!["In a Relationship"]),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text("Happiness Level:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 41),
                child: Text(message!["Happiness"]),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text("Super Power:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 64),
                child: Text(message!["Super Power"]),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text("Motto:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Flexible(
                child: 
                  Padding(
                  padding: EdgeInsets.only(left: 104),
                  child: Text(message!["Motto"]),
                ),
              )
            ],
          ),
          // so that the text will be clickable
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(top:10),
              child: Text(
                "Back", 
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            }
          ),
        ],
      ),
    );
  }
}