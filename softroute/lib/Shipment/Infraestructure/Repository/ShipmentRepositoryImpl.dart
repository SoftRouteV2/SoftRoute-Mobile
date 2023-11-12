import 'package:http/http.dart' as http;

import '../../Domain/Entity/Shipment.dart';
import '../../Domain/Entity/Tracking.dart';
import '../../Domain/Interface/ShipmentRepository.dart'; // Asegúrate de importar el paquete http

class ShipmentServiceImpl implements ShipmentService {
  final ShipmentRepository _repository;

  ShipmentServiceImpl(this._repository);

  @override
  Future<Shipment> getShipmentInfo(String code) {
    return _repository.getShipmentInfo(code);
  }

  @override
  Future<Tracking> getTrackingInfo(int trackingId) async {
    final response = await http.get('http://localhost:8090/api/v1/tracking/$trackingId');

    if (response.statusCode == 200) {
      // Si la solicitud es exitosa, puedes mapear los datos de respuesta a tu modelo de seguimiento
      final trackingData = json.decode(response.body);
      return Tracking(
        trackingId: trackingData['trackingId'],
        latitude: trackingData['latitude'],
        longitude: trackingData['longitude'],
      );
    } else {
      // Manejo de errores
      throw Exception('No se pudo obtener información de seguimiento.');
    }
  }
}
