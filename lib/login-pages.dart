import 'package:flutter/material.dart';
import 'package:kuis/listpoke.dart';

String username = "";
String password = "";

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Column(children: [
          SizedBox(height: 200),
          _usernameField(),
          _passwordField(),
          _loginButton(context),
        ]),
      ),
    );
  }
}

Widget _usernameField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      enabled: true,
      onChanged: (value) {
        username = value;
      },
      decoration: const InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          suffixIcon: Icon(Icons.email)),
    ),
  );
}

Widget _passwordField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      enabled: true,
      onChanged: (value) {
        password = value;
      },
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          suffixIcon: Icon(Icons.vpn_key)),
    ),
  );
}

Widget _loginButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      onPressed: () {
        String text = "";
        if (username == "admin" && password == "admin") {
          Route route = MaterialPageRoute(builder: (context) => ListPoke());
          Navigator.push(context, route);
        } else {
          text = "Login Failed";
        }
        SnackBar snackBar = SnackBar(
          content: Text(text),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('Login'),
    ),
  );
}
