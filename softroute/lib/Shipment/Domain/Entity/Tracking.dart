import '../ValueObject/Latitude.dart';
import '../ValueObject/TrackingId.dart';
import '../ValueObject/latitude.dart';

class Tracking {
  final TrackingId id;
  final Latitude latitude;
  final Longitude longitude;

  Tracking({
    required this.id,
    required this.latitude,
    required this.longitude
  });
}