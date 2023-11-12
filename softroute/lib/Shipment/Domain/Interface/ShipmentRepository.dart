
import '../Entity/Shipment.dart';

abstract class ShipmentRepository {
  Future<Shipment> getShipmentInfo(String code);
}