import '../Model/ShipmentModel.dart';

abstract class ShipmentDataSource {
  Future<ShipmentModel> getShipmentInfo(String code);
}