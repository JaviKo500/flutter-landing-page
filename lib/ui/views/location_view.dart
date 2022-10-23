import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LocationView extends StatelessWidget {
  const LocationView ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: FittedBox(
          child: Text(
            'Location view',
            style: GoogleFonts.montserratAlternates(
              fontSize: 80,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}