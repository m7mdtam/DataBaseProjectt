import 'package:databaseprojectt/ticket_info.dart';
import 'package:flutter/material.dart';
import 'package:databaseprojectt/airport_info.dart';

class SeatSelectionScreen extends StatelessWidget {
  final Flight flight;

  SeatSelectionScreen({required this.flight});

  // Generate 100 seats in the format 1A, 1B, ..., 17E, 17F
  List<String> generateSeats() {
    List<String> seats = [];
    const int numRows = 17; // 17 rows to get close to 100 seats
    const List<String> seatLetters = ['A', 'B', 'C', 'D', 'E', 'F'];

    for (int row = 1; row <= numRows; row++) {
      for (String letter in seatLetters) {
        seats.add('$row$letter');
        if (seats.length == 100) {
          return seats;
        }
      }
    }
    return seats;
  }

  void _showMealDialog(BuildContext context, String seat) {
    TextEditingController mealController = TextEditingController();
    TextEditingController baggageController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose your meal for seat $seat'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: mealController,
                decoration: InputDecoration(
                  labelText: 'Enter meal type',
                ),
              ),
              TextField(
                controller: baggageController,
                decoration: InputDecoration(
                  labelText: 'Enter baggage weight (kg)',
                ),
                keyboardType: TextInputType.number,
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
                String meal = mealController.text;
                String baggageWeight = baggageController.text;
                Navigator.of(context).pop();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlightDetailsScreen(
                      flight: flight,
                      seat: seat,
                      meal: meal,
                      baggageWeight: baggageWeight,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> seats = generateSeats();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Select Seat for ${flight.flightNumber}',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
        GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: seats.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 0, 0, 0)),
              ),
              onPressed: () {
                _showMealDialog(context, seats[index]);
              },
              child: Text(seats[index]),
            );
          },
        ),
      ]),
    );
  }
}
