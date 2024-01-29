import 'package:flutter/material.dart';
import 'package:my_app/slambook_route.dart';

class InitialRoute extends StatefulWidget {
  static const routename = '/';
  InitialRoute({super.key});

  @override
  _InitialRouteState createState() => _InitialRouteState();
}

class _InitialRouteState extends State<InitialRoute> {
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
                Navigator.pushNamed(
                  context,
                  SlambookRoute.routename,
                );
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
      appBar: AppBar(
        title: Text("Friends"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text("No friends yet!"),
                GestureDetector(
                  child: Text(
                    "Go to Slambook", 
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SlambookRoute.routename,
                    );
                  }
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}
