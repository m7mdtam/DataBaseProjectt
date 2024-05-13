// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors_in_immutables

import 'package:databaseprojectt/home_page.dart';
import 'package:databaseprojectt/login_page.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _dobController = TextEditingController();

  final TextEditingController _sexController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/bk.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                validator: (String? value) {
                  return (value == null) ? 'Please Enter your name.' : null;
                },
                controller: _firstNameController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 14.0),
              TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  validator: (String? value) {
                    return (value == null)
                        ? 'Please Enter your last name.'
                        : null;
                  }),
              SizedBox(height: 14.0),
              TextFormField(
                style: TextStyle(color: Colors.white),
                validator: (String? value) {
                  return (value == null) ? 'Please Enter your Email.' : null;
                },
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
                validator: (String? value) {
                  return (value == null) ? 'Please Enter your password.' : null;
                },
                controller: _sexController,
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
              TextFormField(
                style: TextStyle(color: Colors.white),
                validator: (String? value) {
                  return (value == null)
                      ? 'Please Enter your date of birth.'
                      : null;
                },
                controller: _dobController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.date_range_rounded,
                    color: Colors.white,
                  ),
                  labelText: 'Date of Birth',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 14.0),
              TextFormField(
                style: TextStyle(color: Colors.white),
                validator: (String? value) {
                  return (value == null) ? 'Please Enter your sex.' : null;
                },
                controller: _sexController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.female,
                    color: Colors.white,
                  ),
                  labelText: 'Sex',
                  labelStyle: TextStyle(color: Colors.white),
                ),
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
                    onPressed: () {},
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
