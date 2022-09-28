import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),

      appBar: AppBar(
          automaticallyImplyLeading: false,
     leading:  IconButton(
       icon:  const Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pop(),
  ), 
        backgroundColor: Colors.white,
        title: Text("Doxy",style: GoogleFonts.lato(color: Colors.black),),
      ),
      body: Column(
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Input about"),
            ),
          ),
        Center(child: Text("Thanks for Coming Doxy",style: GoogleFonts.lato(color: Colors.green,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}