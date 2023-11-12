import '../Entity/Shipment.dart';

abstract class ShipmentServices {
  Future<Shipment> getShipmentInfo(String code);
}