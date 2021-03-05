import 'dart:convert';

import 'package:aaaa/pages/Home.dart';
import 'package:aaaa/pages/Register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final PassportID = TextEditingController();
  final Password = TextEditingController();
  List data;

  login() async {
    await http.post('http://localhost:8000/api/login', body: {
      'passport_id': PassportID.text,
      'password': Password.text
    }).then(
        (value) => print(value.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FlutterLogo(
                size: 200,
              ),
            ),
            TextField(
              controller: PassportID,
              style: TextStyle(height: 2, fontSize: 18),
              decoration: InputDecoration(hintText: 'Passport id'),
            ),
            TextField(
              obscureText: true,
              controller: Password,
              style: TextStyle(height: 2, fontSize: 18),
              decoration: InputDecoration(hintText: 'Password'),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: RaisedButton(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () => login(),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: Text(
                "Register",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
