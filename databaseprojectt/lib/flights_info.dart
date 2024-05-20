import 'package:databaseprojectt/airport_info.dart';
import 'package:flutter/material.dart';
import 'package:databaseprojectt/seats_info.dart';

class FlightListScreen extends StatelessWidget {
  final List<Flight> flights = [
    Flight(
      flightNumber: 'AA123',
      departureTime: '2024-06-01 08:00',
      arrivalTime: '2024-06-01 12:00',
      departureAirport: 'JFK',
      arrivalAirport: 'LAX',
      price: 300.00,
    ),
    Flight(
      flightNumber: 'BA456',
      departureTime: '2024-06-01 09:00',
      arrivalTime: '2024-06-01 13:00',
      departureAirport: 'LHR',
      arrivalAirport: 'JFK',
      price: 450.00,
    ),
    Flight(
      flightNumber: 'CA789',
      departureTime: '2024-06-01 10:00',
      arrivalTime: '2024-06-01 14:00',
      departureAirport: 'PEK',
      arrivalAirport: 'SFO',
      price: 700.00,
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
