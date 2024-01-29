import 'package:flutter/material.dart';
import 'SummaryArguments.dart';
import 'description_route.dart';

class FriendsRoute extends StatelessWidget {
  static const routename = '/friends';
  final String? title;
  final List<Map>? message;

  const FriendsRoute({super.key, this.title, this.message});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: Text("FriendList"),
                ),
                Column(
                  children: <Widget>[
                    for (var v in message!) 
                      ListTile(
                        title: 
                          GestureDetector(
                            child: Text(
                              v["Name"], 
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DescriptionRoute.routename,
                                arguments: SummaryArguments(
                                    title: "Description", message: v), // the summary object will serve as the argument
                              );
                            }
                          ),
                        leading: Icon(Icons.person),
                      ),
                  ],
                ),
                // the text will be clickable and it will pop the current element on the stack
                GestureDetector(
                  child: Text(
                    "Go to Slambook", 
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}