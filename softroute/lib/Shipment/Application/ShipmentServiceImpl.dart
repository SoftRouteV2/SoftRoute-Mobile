import 'package:softroute/Shipment/Domain/Entity/Shipment.dart';


import '../Domain/Interface/ShipmentServices.dart';

class ShipmentServiceImpl implements ShipmentServices {
  String basePath = "http://192.168.18.6:8090/api/v1/shipment";
  //String basePath = "http://localhost:8090/api/v1/shipment";

  //get shipment by code
  Future<Shipment> getShipmentInfo(String code) async {
    final url = Uri.parse('$basePath/code/$code');

    print("URL: $url");

    try {
      final response = await http.get(
        url,
        headers: {'content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return Shipment.fromJson(jsonData);
      } else if (response.statusCode == 500 || response.statusCode == 400) {
        return Shipment.none();
      } else {
        throw Exception(
            'Failed to fetch shipment data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch shipment data. Error: $e');
    }
  }

}