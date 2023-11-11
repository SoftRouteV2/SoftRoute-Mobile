import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ShipmentDetails extends StatefulWidget {
  const ShipmentDetails({super.key});

  @override
  State<ShipmentDetails> createState() => _ShipmentDetailsState();
}

class _ShipmentDetailsState extends State<ShipmentDetails> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipment Details"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 100, 186),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SleekCircularSlider(
              initialValue: 20,
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
                    style: GoogleFonts.roboto(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
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
