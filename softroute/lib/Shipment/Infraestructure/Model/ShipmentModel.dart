import 'dart:ffi';

class ShipmentModel {
  final Long id;
  final String description;
  final Long code;
  final double freight;
  final int quantity;
  final DateTime deliveredDate;
  final DateTime arrivalDate;
  final double latitude;
  final double longitude;
  final String consignee;

  ShipmentModel({
    required this.id,
    required this.description,
    required this.code,
    required this.freight,
    required this.quantity,
    required this.deliveredDate,
    required this.arrivalDate,
    required this.latitude,
    required this.longitude,
    required this.consignee,
  });
}
