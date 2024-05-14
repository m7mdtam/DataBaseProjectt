// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
import 'package:databaseprojectt/login_page.dart';

import 'package:databaseprojectt/sign_up.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'CYPRUS AIRLINES',
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(7.2, 33.0)),
              ),
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignUp()));
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(7.2, 33.0))),
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ))
        ],
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/hbk.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.6),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                      height: 100,
                      width: 100,
                      child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "lib/images/logo22.jpeg",
                          ))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black,
                  child: Column(
                    children: [
                      Text(
                        'Welcome to Cyprus Airlines system ',
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 139, 245, 141),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'We offer you diffrent flights between turkey and cyprus and between the world with best service and prices that what you would like. ',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.black,
                    height: 190,
                    width: 190,
                    child: Image.asset(
                      'lib/images/o.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    color: Colors.black,
                    height: 190,
                    width: 190,
                    child: Image.asset(
                      'lib/images/c1.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.black,
                    height: 190,
                    width: 190,
                    child: Image.asset(
                      'lib/images/food.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    color: Colors.black,
                    height: 190,
                    width: 190,
                    child: Image.asset(
                      'lib/images/c2.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.black,
                child: Text(
                  'Please sign in to use our offers or sign up if you do not have  account .   ',
                  style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 237, 119, 119),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'CYPRUS INTERNATIONAL UNIVERSITY',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ]),
    );
  }
}
