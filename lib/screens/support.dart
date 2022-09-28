import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportScreen extends StatelessWidget {
const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
      body: Center(
        child: Container(
           height: height*0.07,
           width: width*0.9,
           decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
              FontAwesomeIcons.whatsapp,color: Colors.teal,),
          Text("Official Support-Doxy",style:GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.bold)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal
              ),
              onPressed: (){

              }, child: Text("Contact now",style: GoogleFonts.lato(color: Colors.white),))
        ],
             ),
           )
        ),
      ),
    );
  }
}