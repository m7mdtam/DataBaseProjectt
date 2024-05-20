class Flight {
  final String flightNumber;
  final String departureTime;
  final String arrivalTime;
  final String departureAirport;
  final String arrivalAirport;
  final double price;
  Flight(
      {required this.flightNumber,
      required this.departureTime,
      required this.arrivalTime,
      required this.departureAirport,
      required this.arrivalAirport,
      required this.price});
}
