
class Tracking {
  final int trackingId;
  final String latitude;
  final String longitude;

  Tracking({
    required this.trackingId,
    required this.latitude,
    required this.longitude,
  });

  factory Tracking.fromJson(Map<String, dynamic> json) {
    return Tracking(
      trackingId: json['trackingId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  //create none value shipment

  factory Tracking.none() {
    return Tracking(
      trackingId: 0,
      latitude: '',
      longitude: '',
    );
  }
}
