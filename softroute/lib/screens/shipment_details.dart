import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ShipmentDetails extends StatefulWidget {
  const ShipmentDetails({super.key});

  @override
  State<ShipmentDetails> createState() => _ShipmentDetailsState();
}

class _ShipmentDetailsState extends State<ShipmentDetails> {
  late Timer _timer;
  double _progressValue = -20; // Initial value

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Shipment Details"),
      //   centerTitle: true,
      //   backgroundColor: const Color.fromARGB(255, 68, 100, 186),
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
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
                const SizedBox(height: 100),
                // Shipment Temperature
                Text(
                  "Temperature",
                  style: GoogleFonts.montserrat(
                    color: Colors.indigo[100],
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 30),
                SleekCircularSlider(
                  initialValue: _progressValue,
                  max: 50,
                  min: -20,
                  appearance: CircularSliderAppearance(
                    angleRange: 240,
                    size: MediaQuery.of(context).size.width * 0.5,
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
                  onChange: (value) {},
                )
              ],
            )),
      ),
    );
  }
}
