import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: width*0.06,bottom: height*0.02),
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
                        FontAwesomeIcons.telegram,color: Colors.blue,),
                      Text("Official Support-Doxy",style:GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.bold)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal
                          ),
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("personal link"),

                                actions:[

                                  ElevatedButton(onPressed: (){
                                    Clipboard.setData(ClipboardData(text: "https://t.me/doxyai"));
                                    var snackBar = SnackBar(

                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Succesfully copy!',
                                        message:
                                        'You can conect us in Telegram',
                                        contentType: ContentType.success,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                      child: Text("https://t.me/doxyai"))

                                ],
                              ),
                            );
                          }, child: Text("Contact now",style: GoogleFonts.lato(color: Colors.white),))
                    ],
                  ),
                )
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: width*0.06),
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
                        FontAwesomeIcons.telegram,color: Colors.blue,),
                      Text("Official Support-Doxy",style:GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.bold)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal
                          ),
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Our Teligram Group link"),

                                actions:[

                                  ElevatedButton(onPressed: (){
                                    Clipboard.setData(ClipboardData(text: "https://t.me/+f-wZg6eaKBxhZGFl"));
                                    var snackBar = SnackBar(

                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'Succesfully copy!',
                                        message:
                                        'You can conect us in Telegram',
                                        contentType: ContentType.success,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                      child: Text("https://t.me/+f-wZg6eaKBxhZGFl"))

                                ],
                              ),
                            );
                          }, child: Text("Contact now",style: GoogleFonts.lato(color: Colors.white),))
                    ],
                  ),
                )
            ),
          ),
        ],
      )
    );
  }
}

