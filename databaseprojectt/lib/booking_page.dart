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
        title: Text('Book Your Flight'),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Origin Airport:',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextFormField(
                onChanged: (value) {
                  originCity = value;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Destination Airport:',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextFormField(
                onChanged: (value) {
                  destinationCity = value;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Departure Date:',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () => _selectDate(true),
                child: Text(departureDate),
              ),
              SizedBox(height: 20),
              Text(
                'Return Date:',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () => _selectDate(false),
                child: Text(returnDate),
              ),
              SizedBox(height: 20),
              Text(
                'Passengers:',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement booking logic here
                  print('Origin City: $originCity');
                  print('Destination City: $destinationCity');
                  print('Departure Date: $departureDate');
                  print('Return Date: $returnDate');
                  print('Passengers: $passengersCount');
                },
                child: Text('Book Now'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
