import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../services/shipment_service.dart';
import '../styles/styles.dart';
import '../widgets/error_snackbar.dart';

class TrackingDetails extends StatefulWidget {
  final String code;
  const TrackingDetails({super.key, required this.code});

  @override
  State<TrackingDetails> createState() => _TrackingDetailsState();
}

class _TrackingDetailsState extends State<TrackingDetails> {

  double _progressValue = -20; // Initial value
  double latitude = 10;
  double longitude = 10;




  @override
  void initState() {
    super.initState();
    searchShipment();
  }

  @override
  void dispose() {
    super.dispose();
  }



  void searchShipment() {
    String code = widget.code;

    ShipmentService().getShipmentByCode(code).then((shipment) {
      print("object");

      if (shipment.id != 0) {
        setState(() {
          latitude = double.parse(shipment.tracking.latitude);
          print(latitude);
          longitude = double.parse(shipment.tracking.longitude);
          print(longitude);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 5),
            content: CustomSnackBarContent(
              errorText: "Server Error. Please try again.",
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shipment Tracking')),
      body: (latitude != 0 && longitude != 0)
          ? GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('shipmentLocation'),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(title: 'Shipment Location'),
          ),
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
