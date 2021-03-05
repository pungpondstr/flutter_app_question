import 'package:aaaa/pages/Login.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              ),
              child: Center(
                child: Text('Logout'),
              ),
              color: Colors.blue,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
