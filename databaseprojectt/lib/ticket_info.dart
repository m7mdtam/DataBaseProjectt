import 'package:flutter/material.dart';
import 'package:databaseprojectt/airport_info.dart';

class FlightDetailsScreen extends StatelessWidget {
  final Flight flight;
  final String seat;
  final String meal;
  final String baggageWeight;

  FlightDetailsScreen(
      {required this.flight,
      required this.seat,
      required this.meal,
      required this.baggageWeight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Flight Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flight Number: ${flight.flightNumber}',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
                'Departure: ${flight.departureTime} (${flight.departureAirport})',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Arrival: ${flight.arrivalTime} (${flight.arrivalAirport})',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Seat: $seat', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Meal: $meal', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Baggage Weight: $baggageWeight kg',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Price: \$${flight.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
