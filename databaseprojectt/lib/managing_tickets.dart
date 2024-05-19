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
              _addTicket(context);
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          )
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
                    '${tickets[index].originCity}  ${tickets[index].departureTime} \n${tickets[index].destinationCity}  ${tickets[index].arrivalTime}',
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
                              color: Color.fromARGB(255, 83, 94, 11)),
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
    TextEditingController originController =
        TextEditingController(text: tickets[index].originCity);
    TextEditingController destinationController =
        TextEditingController(text: tickets[index].destinationCity);
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
                    originCity: originController.text,
                    destinationCity: destinationController.text,
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
    TextEditingController originController = TextEditingController();
    TextEditingController destinationController = TextEditingController();
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
                  tickets.add(FlightTicket(
                    originCity: originController.text,
                    destinationCity: destinationController.text,
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
  final String originCity;
  final String destinationCity;
  final String departureTime;
  final String arrivalTime;
  final double price;

  FlightTicket(
      {required this.originCity,
      required this.destinationCity,
      required this.departureTime,
      required this.arrivalTime,
      required this.price});
}
