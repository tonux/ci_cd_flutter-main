import 'package:flutter/material.dart';

void main() => (runApp(LoginPage()));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Connexion'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Se Connecter',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Login'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Connexion',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  // shape: RoundedRectangleBorder(
                  // borderRadius: BorderRadius.circular(20)),
                  // color: Colors.blue,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Inscription',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
