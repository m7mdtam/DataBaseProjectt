// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors_in_immutables, depend_on_referenced_packages, unused_local_variable, avoid_print, non_constant_identifier_names, unused_import, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:core';

import 'package:databaseprojectt/home_page.dart';
import 'package:databaseprojectt/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:databaseprojectt/constants.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _dobController = TextEditingController();

  final TextEditingController _sexController = TextEditingController();

  void AddData() async {
    var name = _firstNameController.text;
    var email = _emailController.text;
    var password = _passwordController.text;
    http.Response response = await http.post(
      Uri.parse(endpoint + "signup.php"),
      body: json.encode(
        {"name": name, "email": email, "password": password},
      ),
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('message'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/bkk.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _firstNameController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  labelText: ' Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 14.0),
              SizedBox(height: 14.0),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _emailController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 14.0),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _passwordController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                obscureText: true,
              ),
              SizedBox(height: 14.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      'Back home',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  ElevatedButton(
                    onPressed: () {
                      AddData();
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member ? ',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        fontSize: 17,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 0.0),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      style: TextStyle(fontSize: 18),
                      'Sign in',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
