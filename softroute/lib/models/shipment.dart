import 'package:softroute/models/dht22.dart';
import 'package:softroute/models/sender.dart';
import 'package:softroute/models/tracking.dart';

import 'destination.dart';
import 'employee.dart';

class Shipment {
  final int id;
  final String description;
  final int code;
  final double freight;
  final int quantity;
  final String deliveredDate;
  final String arrivalDate;
  final Employee employee;
  final Sender sender;
  final Destination destination;
  final String consignee;
  final Dht22 dht22;
  final Tracking tracking;

  Shipment({
    required this.id,
    required this.description,
    required this.code,
    required this.freight,
    required this.quantity,
    required this.deliveredDate,
    required this.arrivalDate,
    required this.employee,
    required this.sender,
    required this.destination,
    required this.consignee,
    required this.dht22,
    required this.tracking
  });

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      id: json['id'],
      description: json['description'],
      code: json['code'],
      freight: json['freight'],
      quantity: json['quantity'],
      deliveredDate: json['deliveredDate'],
      arrivalDate: json['arrivalDate'],
      employee: Employee.fromJson(json['employee']),
      sender: Sender.fromJson(json['sender']),
      destination: Destination.fromJson(json['destination']),
      consignee: json['consignee'],
      dht22: Dht22.fromJson(json['dht22']),
      tracking: Tracking.fromJson(json['tracking'])
    );
  }

  //create none value shipment

  factory Shipment.none() {
    return Shipment(
      id: 0,
      description: '',
      code: 0,
      freight: 0,
      quantity: 0,
      deliveredDate: '',
      arrivalDate: '',
      employee: Employee(
        employeeId: 0,
        dni: 0,
        employeeName: '',
        password: '',
        email: '',
      ),
      sender: Sender(
        senderId: 0,
        fullname: '',
        dni: '',
      ),
      destination: Destination(
        destinationId: 0,
        departure: '',
        arrival: '',
      ),
      consignee: '',
      dht22: Dht22(
        id: 0,
        temperature: '',
        humidity: '',
      ),
      tracking: Tracking(
        trackingId: 0,
        latitude: '',
        longitude: ''
      )
    );
  }
}
