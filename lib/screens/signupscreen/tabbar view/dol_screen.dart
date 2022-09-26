import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgtes/slider_view.dart';




class DolScreen extends StatelessWidget {
  const DolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return  Scaffold(
     drawer: Drawer(
      child:SliderView()
    ),
      backgroundColor: const Color(0xffE5E5E5),
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon:CircleAvatar(
             radius: 14,
             backgroundColor: const Color.fromARGB(255, 91, 95, 97),
             child:  Padding(
               padding: const EdgeInsets.all(8.0),
               child: SvgPicture.asset("assets/user-solid.svg",color: Colors.white,),
             )),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        
        
        actions: [
         IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.bell,color: Colors.black,))
         ],),
         body: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
            children: [
              Number4PageWidget(height: height, width: width),
              SizedBox(height: height*0.01,),
              Number4PageSecondContainer(height: height, width: width),
               SizedBox(height: height*0.01,),
              Container(
                height: height*0.24,
                width: width,
                  decoration: BoxDecoration( color: Colors.white,
      borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Team Members",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold),),
 SizedBox(height: height*0.01,),
 Container(
      height: height*0.07,
      width: width*0.9,
      decoration: BoxDecoration(color: Colors.black12,
      borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding:  EdgeInsets.only(left: width*0.03,top: height*0.002),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: height*0.01,),
            Text("Total team members",  style: GoogleFonts.lato(color:Colors.black26,fontSize: 13)),
            SizedBox(width: height*0.01,),
            Text("0",  style: GoogleFonts.lato(color:Colors.black,fontSize: 16)),
           
          ],
        ),
      ),
    ),
    SizedBox(height: height*0.01,),
     Container(
     height: height*0.09,
      width: width*0.9,
      decoration: BoxDecoration(color: Colors.black12,
      borderRadius: BorderRadius.circular(7)),
      child: Padding(
      padding:  EdgeInsets.only(left: width*0.03,),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text("Team 1 Lavel",  style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
             SizedBox(width: width*0.01,),
             Row(
              children: [
                 Text("0",  style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                  SizedBox(width: width*0.01,),
                 Text("Person",  style: GoogleFonts.lato(color:Colors.black26,fontSize: 14))
              ],
             )
            
            ],
           ),
         ),
         SizedBox(width: width*0.09,),
          Container(
           decoration: BoxDecoration(
             border: Border(
           left: BorderSide(width: 16.0, color: Colors.white),
          
          ),
         
           ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text("Team 1 Lavel",  style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                SizedBox(width: width*0.01,),
                Row(
                 children: [
                    Text("0",  style: GoogleFonts.lato(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                     SizedBox(width: width*0.01,),
                    Text("Person",  style: GoogleFonts.lato(color:Colors.black26,fontSize: 14))
                 ],
                )
               
               ],
              ),
            ),
          ),
            
   
           
          ],
        ),
      ),
    ),
    
          ],
        ),
      ),
              )



            ],
           ),
         ),
    );
  }
}

class Number4PageSecondContainer extends StatelessWidget {
  const Number4PageSecondContainer({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height*0.2 ,
      width: width,
      decoration: BoxDecoration( color: Colors.white,
      borderRadius: BorderRadius.circular(8)
    ),
    child: Column(
      children: [
         SizedBox(height: height*0.01,),
    Container(
      height: height*0.04,
      width: width*0.9,
      decoration: BoxDecoration(color: Colors.black12,
      borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding:  EdgeInsets.only(left: width*0.03,top: height*0.002),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Invite Code",  style: GoogleFonts.lato(color:Colors.black26,fontSize: 13)),
            SizedBox(width: width*0.35,),
            Text("1122345",  style: GoogleFonts.lato(color:Colors.black,fontSize: 13)),
            SizedBox(width: width*0.02,),
            Text("Copy",  style: GoogleFonts.lato(color:Colors.green,fontSize: 14))
          ],
        ),
      ),
    ),
    SizedBox(height: height*0.01,),
     Container(
      height: height*0.05,
      width: width*0.9,
      decoration: BoxDecoration(color: Colors.black12,
      borderRadius: BorderRadius.circular(7)),
      child: Padding(
      padding:  EdgeInsets.only(left: width*0.03,top: height*0.002),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Invite Code",  style: GoogleFonts.lato(color:Colors.black26,fontSize: 13)),
            SizedBox(width: width*0.05,),
            SizedBox(width: width*0.31,
              child: Text("http//:www.cbcubuib.com",  style: GoogleFonts.lato(color:Colors.black,fontSize: 13))),
            SizedBox(width: width*0.15,),
            Text("Copy",  style: GoogleFonts.lato(color:Colors.green,fontSize: 14))
          ],
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: ElevatedButton(onPressed: (){}, child: Text("Invite friends"))),
    )

      ],
    ),
    );
  }
}

class Number4PageWidget extends StatelessWidget {
  const Number4PageWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height*0.2 ,
      width: width,
      decoration: BoxDecoration( color: Colors.white,
      borderRadius: BorderRadius.circular(8)
      ),
     
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: width*0.02,top: height*0.01,bottom: height*0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,borderRadius: BorderRadius.circular(2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text("High rewards",style: GoogleFonts.lato(color: Colors.white,fontSize: 7),),
                  )),
                Text("Invite friends and\nmake money together",
                style: GoogleFonts.lato(color: const Color(0xff000000),fontWeight: FontWeight.bold,fontSize: 15),),
                Text("Earn up to 12% commission\nbonus on every trade",  style: GoogleFonts.lato(color:Colors.black26,fontSize: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("view Rules",  style: GoogleFonts.lato(color:Colors.green,fontWeight: FontWeight.bold,fontSize: 15)),
                    Icon(FontAwesomeIcons.chevronRight,color: Colors.green,size: 15,)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: height*0.17,
            width: width*.5,
            child: Image.asset("assets/togather.jpg",fit: BoxFit.cover,))
        ],
      ),
    );
  }
}
