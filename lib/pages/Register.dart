import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final Firstname = TextEditingController();
  final Lastname = TextEditingController();
  final PassportID = TextEditingController();
  final Password = TextEditingController();
  final ConfirmPassword = TextEditingController();
  final Email = TextEditingController();
  final Tel = TextEditingController();
  final PassportImages = TextEditingController();

  register () async {
    await http.post('http://localhost:8000/api/register', body: {
      'first_name': Firstname.text,
      'last_name': Lastname.text,
      'passport_id': (PassportID.text),
      'password': Password.text,
      //'confirm_password': ConfirmPassword.text,
      'email': Email.text,
      'tel': Tel.text,
      'passport_images': 'welcome',
    }).then((value) => print(value.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              controller: Firstname,
              style: TextStyle(height: 2, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Firstname',
              ),
            ),
            TextField(
              controller: Lastname,
              style: TextStyle(height: 2, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Lastname',
              ),
            ),
            TextField(
              controller: PassportID,
              style: TextStyle(height: 2, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Passport id',
              ),
            ),
            TextField(
              controller: Password,
              obscureText: true,
              style: TextStyle(height: 2, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            TextField(
              controller: ConfirmPassword,
              obscureText: true,
              style: TextStyle(height: 2, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Confirm password',
              ),
            ),
            TextField(
              controller: Email,
              style: TextStyle(height: 2, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: Tel,
              style: TextStyle(height: 2, fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Tel',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () => register(),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
