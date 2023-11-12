class Shipment {
  final int id;
  final String description;
  final int code;
  final int freight;
  final int quantity;
  final DateTime deliveredDate;
  final DateTime arrivalDate;
  final ShipmentLocation shipmentLocation;
  final String consignee;

  Shipment({
    required this.id,
    required this.description,
    required this.code,
    required this.freight,
    required this.quantity,
    required this.deliveredDate,
    required this.arrivalDate,
    required this.shipmentLocation,
    required this.consignee,
  });
}

class ShipmentLocation {
  final double latitude;
  final double longitude;

  ShipmentLocation({
    required this.latitude,
    required this.longitude,
  });
}
