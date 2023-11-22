import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../services/shipment_service.dart';
import '../styles/styles.dart';
import '../widgets/error_snackbar.dart';

class ShipmentDetails extends StatefulWidget {
  final String code;
  const ShipmentDetails({super.key, required this.code});

  @override
  State<ShipmentDetails> createState() => _ShipmentDetailsState();
}

class _ShipmentDetailsState extends State<ShipmentDetails> {
  late Timer _timer;
  double _progressValue = -20; // Initial value
  double temperatureValue = 10;
  double humidityValue = 10;

  Color getTextColor(double value) {
    // Customize this function to determine the color based on the temperature value
    if (value < 12) {
      return Colors.blue; // Use your color logic here
    } else if (value < 30) {
      return Colors.orange; // Use your color logic here
    } else {
      return Colors.red; // Use your color logic here
    }
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    searchShipment();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        // Update the progress value every second
        _progressValue += 1;
        if (_progressValue > 50) {
          // If we reach the maximum value, reset to the minimum
          _progressValue = -20;
        }
      });
    });
  }

  void searchShipment() {
    String code = widget.code;

    ShipmentService().getShipmentByCode(code).then((shipment) {
      print("object");

      if (shipment.id != 0) {
        setState(() {
          temperatureValue = double.parse(shipment.dht22.temperature);
          humidityValue = double.parse(shipment.dht22.humidity);
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
      body: SafeArea(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF665BA4), Color(0xFF1C3158)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      //back ios icon
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Shipment Details",
                        style: GoogleFonts.montserrat(
                          color: const Color.fromARGB(255, 206, 223, 246),
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                // Shipment Temperature
                Text(
                  "Temperature",
                  style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(255, 206, 223, 246),
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 30),
                SleekCircularSlider(
                  initialValue: temperatureValue,
                  max: 50,
                  min: -20,
                  appearance: CircularSliderAppearance(
                    angleRange: 240,
                    size: MediaQuery.of(context).size.width * 0.6,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      progressBarColors: [
                        //temperature gradient colors
                        const Color.fromARGB(255, 255, 17, 0),
                        Colors.yellow,
                        const Color.fromARGB(255, 55, 145, 255)
                      ],
                      trackColor: Colors.indigo[100],
                    ),
                  ),
                  innerWidget: (double value) {
                    // Customize the inner widget to display temperature in °C
                    return Center(
                      child: Text(
                        '${value.toInt()}°C',
                        style: GoogleFonts.montserrat(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: getTextColor(value)),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 10),
                //create a himidity SleeveCircularSlider
                Text(
                  "Humidity",
                  style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(255, 212, 215, 241),
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),

                SleekCircularSlider(
                  initialValue: 360,
                  max: 360,
                  min: 0,
                  appearance: CircularSliderAppearance(
                    angleRange: 360,
                    size: MediaQuery.of(context).size.width * 0.6,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      dotColor: Colors.transparent,
                      progressBarColor: const Color.fromARGB(183, 86, 161, 251),
                      trackColor: Colors.transparent,
                    ),
                  ),
                  innerWidget: (double value) {
                    // Customize the inner widget to display temperature in °C
                    return Center(
                      child: Text(
                        '$humidityValue%',
                        style: GoogleFonts.montserrat(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 206, 223, 246)),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                //create a refresh button

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: MediaQuery.of(context).size.width * 0.17,
                      height: MediaQuery.of(context).size.width * 0.17,
                      child: InkWell(
                        onTap: () {
                          searchShipment();
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
