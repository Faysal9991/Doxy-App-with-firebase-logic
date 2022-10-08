import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuideScreen extends StatelessWidget {
const GuideScreen({super.key});

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
        title: Text("Gude line",style: GoogleFonts.lato(color: Colors.black),),
      ),
      body: Column(
        children: [
          SizedBox(height: 200,),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("1.ইনভেস্ট ছাড়া কি ইনকাম করতে পারবো?\n- জ্বী না, আপনাকে ইনভেস্ট করতে হবে,নূন্যতম একটি রোবট কিনতে হবে,\n৩.আমি কি রেফার করলে টাকা পাবো?\n-হ্যাঁ আপনি রেফার করলে টাকা পাবেন,\n৪. কত টাকা হলো উইথড্র  করতে পারবো..?\n- আপনি ১০০৳ হলে উইথড্র করতে পারবেন..!"),
            ),
          ),
        Center(child: Text("Thanks for reading",style: GoogleFonts.lato(color: Colors.green,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}