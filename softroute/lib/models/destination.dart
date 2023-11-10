class Destination {
  final int destinationId;
  final String departure;
  final String arrival;

  Destination({
    required this.destinationId,
    required this.departure,
    required this.arrival,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      destinationId: json['destinationId'],
      departure: json['departure'],
      arrival: json['arrival'],
    );
  }
}
