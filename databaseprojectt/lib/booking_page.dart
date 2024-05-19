// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_import, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:databaseprojectt/login_page.dart';
import 'package:databaseprojectt/sign_up.dart';
import 'package:flutter/material.dart';

class FlightBookingPage extends StatefulWidget {
  @override
  _FlightBookingPageState createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage> {
  String originCity = '';
  String destinationCity = '';
  String departureDate = 'Select Departure Date';
  String returnDate = 'Select Return Date';
  int passengersCount = 1;

  Future<void> _selectDate(bool isDepartureDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isDepartureDate) {
          departureDate = picked.toString();
        } else {
          returnDate = picked.toString();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.flight,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          'Book Your Flight',
          style: TextStyle(color: Colors.white),
        ),
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
          color: Colors.black.withOpacity(0.4),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Icon(Icons.flight_takeoff, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Origin City:',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              TextFormField(
                onChanged: (value) {
                  originCity = value;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.flight_takeoff, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Airport:',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              TextFormField(
                onChanged: (value) {
                  originCity = value;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.flight_land, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Destination City:',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              TextFormField(
                onChanged: (value) {
                  destinationCity = value;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.flight_land, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Airport:',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              TextFormField(
                onChanged: (value) {
                  originCity = value;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.date_range, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Departure Date:',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _selectDate(true),
                child: Text(departureDate),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.date_range, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Return Date: (Optional)',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _selectDate(false),
                child: Text(returnDate),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.person_2, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Passengers:',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              DropdownButton<int>(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black),
                value: passengersCount,
                onChanged: (var newValue) {
                  setState(() {
                    passengersCount = newValue!;
                  });
                },
                items: <int>[1, 2, 3, 4, 5]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      ' Back',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement booking logic here
                      print('Origin City: $originCity');
                      print('Destination City: $destinationCity');
                      print('Departure Date: $departureDate');
                      print('Return Date: $returnDate');
                      print('Passengers: $passengersCount');
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(fontSize: 20),
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
