import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softroute/screens/welcome.dart';
import 'package:softroute/services/shipment_service.dart';
import 'package:softroute/styles/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //create a text editing controller called codeController

  TextEditingController codeController = TextEditingController();

  void searchShipment(String code) {
    print("This is the entered Code");
    print(code);

    ShipmentService().getShipmentByCode(code).then((shipment) {
      if (shipment.id != 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Welcome(),
            ));
      }

      print("SHIPMENT NOT FOUND");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [tertiaryColor, quaternaryColor],
            ),
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    "Find Your Shipment",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 100),
                Text(
                  "Shipment Code",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //create an input field
                const SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: codeController,
                  decoration: InputDecoration(
                    hintText: "Enter Shipment Code",
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      searchShipment(codeController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      textStyle: GoogleFonts.roboto(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text(
                      "Search",
                      style: GoogleFonts.roboto(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
