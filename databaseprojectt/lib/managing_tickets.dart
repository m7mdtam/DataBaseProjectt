// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, avoid_web_libraries_in_flutter, unused_import

import 'package:flutter/material.dart';

class Managing extends StatefulWidget {
  @override
  _FlightBookingPageState createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<Managing> {
  List<FlightTicket> tickets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _seatInfoDialog(context);
            },
            icon: Icon(
              Icons.chair,
              color: Colors.amber,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              _showFlightInfoDialog(context);
            },
            icon: Icon(
              Icons.location_city_rounded,
              color: Colors.amber,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              _serviceInfoDialog(context);
            },
            icon: Icon(
              Icons.food_bank,
              color: Colors.amber,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              _addTicket(context);
            },
            icon: Icon(
              Icons.airplane_ticket,
              color: Colors.amber,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.flight_outlined,
          color: Colors.white,
        ),
        title: Text(
          'Flight Tickets',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 78, 3, 255)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.all(7.0),
                child: ListTile(
                  tileColor: Color.fromARGB(78, 57, 153, 198),
                  title: Text(
                    '${tickets[index].fnum}\n${tickets[index].originCity} ${tickets[index].ocity} ${tickets[index].departureTime} \n${tickets[index].destinationCity} ${tickets[index].dcity}  ${tickets[index].arrivalTime}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$${tickets[index].price.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 151, 114, 3)),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            _editTicket(context, index);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmDelete(context, index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _serviceInfoDialog(BuildContext context) {
    TextEditingController serviceIdController = TextEditingController();
    TextEditingController mealController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Service Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: serviceIdController,
                decoration: InputDecoration(
                  labelText: 'Enter service ID',
                  fillColor: Colors.grey[200], // Fill color
                  filled: true, // Enable fill color
                  labelStyle: TextStyle(color: Colors.grey), // Label text color
                  border: OutlineInputBorder(), // Border style
                ),
                style: TextStyle(color: Colors.black), // Text color
              ),
              SizedBox(height: 10),
              TextField(
                controller: mealController,
                decoration: InputDecoration(
                  labelText: 'Enter Meal Type',
                  fillColor: Colors.grey[200], // Fill color
                  filled: true, // Enable fill color
                  labelStyle: TextStyle(color: Colors.grey), // Label text color
                  border: OutlineInputBorder(), // Border style
                ),
                style: TextStyle(color: Colors.black), // Text color
              ),
              SizedBox(height: 10),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                String serviceid = serviceIdController.text;
                String meal = mealController.text;

                Navigator.of(context).pop();

                // Show Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Service details were added'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _seatInfoDialog(BuildContext context) {
    TextEditingController serviceIdController = TextEditingController();
    TextEditingController mealController = TextEditingController();
    TextEditingController a = TextEditingController();

    TextEditingController b = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Seat Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: serviceIdController,
                decoration: InputDecoration(
                  labelText: 'Enter seat ID',
                  fillColor: Colors.grey[200], // Fill color
                  filled: true, // Enable fill color
                  labelStyle: TextStyle(color: Colors.grey), // Label text color
                  border: OutlineInputBorder(), // Border style
                ),
                style: TextStyle(color: Colors.black), // Text color
              ),
              SizedBox(height: 10),
              TextField(
                controller: mealController,
                decoration: InputDecoration(
                  labelText: 'Enter airplane ID',
                  fillColor: Colors.grey[200], // Fill color
                  filled: true, // Enable fill color
                  labelStyle: TextStyle(color: Colors.grey), // Label text color
                  border: OutlineInputBorder(), // Border style
                ),
                style: TextStyle(color: Colors.black), // Text color
              ),
              SizedBox(height: 10),
              TextField(
                controller: a,
                decoration: InputDecoration(
                  labelText: 'Enter seat number',
                  fillColor: Colors.grey[200], // Fill color
                  filled: true, // Enable fill color
                  labelStyle: TextStyle(color: Colors.grey), // Label text color
                  border: OutlineInputBorder(), // Border style
                ),
                style: TextStyle(color: Colors.black), // Text color
              ),
              SizedBox(height: 10),
              TextField(
                controller: b,
                decoration: InputDecoration(
                  labelText: 'Enter class',
                  fillColor: Colors.grey[200], // Fill color
                  filled: true, // Enable fill color
                  labelStyle: TextStyle(color: Colors.grey), // Label text color
                  border: OutlineInputBorder(), // Border style
                ),
                style: TextStyle(color: Colors.black), // Text color
              ),
              SizedBox(height: 10),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                String serviceid = serviceIdController.text;
                String meal = mealController.text;

                Navigator.of(context).pop();

                // Show Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Service details were added'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showFlightInfoDialog(BuildContext context) {
    TextEditingController airportIdController = TextEditingController();
    TextEditingController modelController = TextEditingController();
    TextEditingController capacityController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Airplane Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: airportIdController,
                decoration: InputDecoration(
                  labelText: 'Enter Airport ID',
                  fillColor: Colors.grey[200], // Fill color
                  filled: true, // Enable fill color
                  labelStyle: TextStyle(color: Colors.grey), // Label text color
                  border: OutlineInputBorder(), // Border style
                ),
                style: TextStyle(color: Colors.black), // Text color
              ),
              SizedBox(height: 10),
              TextField(
                controller: modelController,
                decoration: InputDecoration(
                  labelText: 'Enter Model',
                  fillColor: Colors.grey[200], // Fill color
                  filled: true, // Enable fill color
                  labelStyle: TextStyle(color: Colors.grey), // Label text color
                  border: OutlineInputBorder(), // Border style
                ),
                style: TextStyle(color: Colors.black), // Text color
              ),
              SizedBox(height: 10),
              TextField(
                controller: capacityController,
                decoration: InputDecoration(
                  labelText: 'Enter Capacity',
                  fillColor: Colors.grey[200], // Fill color
                  filled: true, // Enable fill color
                  labelStyle: TextStyle(color: Colors.grey), // Label text color
                  border: OutlineInputBorder(), // Border style
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black), // Text color
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                String airportId = airportIdController.text;
                String model = modelController.text;
                String capacity = capacityController.text;

                Navigator.of(context).pop();

                // Show Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Airplane details were added'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Deletion',
            style: TextStyle(fontSize: 30),
          ),
          content: Text(
            'Are you sure you want to delete this ticket?!',
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  tickets.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Yes',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  void _editTicket(BuildContext context, int index) {
    TextEditingController fnumController =
        TextEditingController(text: tickets[index].fnum);
    TextEditingController originController =
        TextEditingController(text: tickets[index].originCity);
    TextEditingController ocityController =
        TextEditingController(text: tickets[index].ocity);
    TextEditingController destinationController =
        TextEditingController(text: tickets[index].destinationCity);
    TextEditingController dcityController =
        TextEditingController(text: tickets[index].dcity);
    TextEditingController departureTimeController =
        TextEditingController(text: tickets[index].departureTime);
    TextEditingController arrivalTimeController =
        TextEditingController(text: tickets[index].arrivalTime);
    TextEditingController priceController =
        TextEditingController(text: tickets[index].price.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Flight Ticket'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: fnumController,
                decoration: InputDecoration(labelText: 'Flight Number'),
              ),
              TextField(
                controller: originController,
                decoration: InputDecoration(labelText: 'Origin Airport'),
              ),
              TextField(
                controller: destinationController,
                decoration: InputDecoration(labelText: 'Destination Airport'),
              ),
              TextField(
                controller: departureTimeController,
                decoration: InputDecoration(labelText: 'Departure Time'),
              ),
              TextField(
                controller: arrivalTimeController,
                decoration: InputDecoration(labelText: 'Arrival Time'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  tickets[index] = FlightTicket(
                    fnum: fnumController.text,
                    originCity: originController.text,
                    ocity: ocityController.text,
                    destinationCity: destinationController.text,
                    dcity: dcityController.text,
                    departureTime: departureTimeController.text,
                    arrivalTime: arrivalTimeController.text,
                    price: double.parse(priceController.text),
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _addTicket(BuildContext context) {
    TextEditingController fnumController = TextEditingController();
    TextEditingController originController = TextEditingController();
    TextEditingController ocityController = TextEditingController();

    TextEditingController destinationController = TextEditingController();
    TextEditingController dcityController = TextEditingController();

    TextEditingController departureTimeController = TextEditingController();
    TextEditingController arrivalTimeController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Flight Ticket'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: fnumController,
                decoration: InputDecoration(labelText: 'Flight Number'),
              ),
              TextField(
                controller: originController,
                decoration: InputDecoration(labelText: 'Origin Airport'),
              ),
              TextField(
                controller: ocityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              TextField(
                controller: destinationController,
                decoration: InputDecoration(labelText: 'Destination Airport'),
              ),
              TextField(
                controller: dcityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              TextField(
                controller: departureTimeController,
                decoration: InputDecoration(labelText: 'Departure Time'),
              ),
              TextField(
                controller: arrivalTimeController,
                decoration: InputDecoration(labelText: 'Arrival Time'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  tickets.add(FlightTicket(
                    fnum: fnumController.text,
                    originCity: originController.text,
                    ocity: ocityController.text,
                    destinationCity: destinationController.text,
                    dcity: dcityController.text,
                    departureTime: departureTimeController.text,
                    arrivalTime: arrivalTimeController.text,
                    price: double.parse(priceController.text),
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class FlightTicket {
  final String fnum;

  final String originCity;
  final String ocity;

  final String destinationCity;
  final String dcity;

  final String departureTime;
  final String arrivalTime;
  final double price;

  FlightTicket(
      {required this.fnum,
      required this.originCity,
      required this.ocity,
      required this.destinationCity,
      required this.dcity,
      required this.departureTime,
      required this.arrivalTime,
      required this.price});
}
