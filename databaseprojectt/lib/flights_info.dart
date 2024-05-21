import 'package:databaseprojectt/airport_info.dart';
import 'package:flutter/material.dart';
import 'package:databaseprojectt/seats_info.dart';

class FlightListScreen extends StatelessWidget {
  final List<Flight> flights = [
    Flight(
      flightNumber: 'PC100',
      departureTime: '2024-05-30 18:45',
      arrivalTime: '2024-05-30 19:45',
      departureAirport: 'ECN',
      arrivalAirport: 'ATY',
      price: 100.00,
    ),
    Flight(
      flightNumber: 'PC400',
      departureTime: '2024-05-30 20:00',
      arrivalTime: '2024-05-30 21:00',
      departureAirport: 'ECN',
      arrivalAirport: 'ATY',
      price: 120.00,
    ),
    Flight(
      flightNumber: 'PC420',
      departureTime: '2024-05-30 21:10',
      arrivalTime: '2024-05-30 22:10',
      departureAirport: 'ECN',
      arrivalAirport: 'ATY',
      price: 170.00,
    ),
    Flight(
      flightNumber: 'PC430',
      departureTime: '2024-05-30 22:30',
      arrivalTime: '2024-05-30 23:30',
      departureAirport: 'ECN',
      arrivalAirport: 'ATY',
      price: 200.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Available Flights',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: flights.length,
        itemBuilder: (context, index) {
          final flight = flights[index];
          return Card(
            color: Colors.amber,
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                'Flight Number: ${flight.flightNumber}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Departure: ${flight.departureTime} (${flight.departureAirport})',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'Arrival: ${flight.arrivalTime} (${flight.arrivalAirport})',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              trailing: Text(
                '\$${flight.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: const Color.fromARGB(255, 3, 67, 5)),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeatSelectionScreen(flight: flight),
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
