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
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("app provides breaking and latest trending news update on the go.."

                 " This portal app for world news from the most current phenomenon that keeps you updated with the latest happenings in all over the world."

                  "Currently, digital news portals have been one of the most important news sources for Internet users. However, the way it is written depends on the direction of the content. "
                  "One approach to news reporting is through manipulative writing. Such method of writing has created a number of adverse outcomes such as political unrest, slander and negative perception towards the particular organization, personnel, and country.."
                  "SO, It is important for readers to choose and select news portal that is reporting positively and to neglect portals which practices manipulative writing approach for their own gains or causing negative impact towards the community.."
                  "Readers also have to verify the news they get from not verified portals.."
                 "Features of this app:"
                 "● It is user friendly. Anyone can have access easily."
                  "● This portal contains journals and conference proceeding videos."
                  "● No manipulative writing approach"
                 " ● Truth telling.."),
            ),
          ),
        Center(child: Text("Thanks for Coming Doxy",style: GoogleFonts.lato(color: Colors.green,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}