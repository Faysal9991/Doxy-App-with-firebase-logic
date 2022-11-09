import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/screens/loginscreen/loginpage.dart';
import 'package:jadeais/screens/recarge_history.dart';
import 'package:jadeais/utils/color_plate.dart';

import '../mls/profilemodel.dart';

class SliderView extends StatefulWidget {
  const SliderView({Key? key}) : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  FireBase fireBase = FireBase();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Platte.background,
      body: StreamBuilder<Profile>(
          stream: fireBase.myProfileStream(),
          builder: (context, snap) {
            return snap.hasData?Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  SizedBox(height: height*0.03,),
                  Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Platte.hotPink,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 2,color: Platte.light)
                              ),
                              child: Image(image: AssetImage("assets/avater.png"),),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 10,),
                                Container(
                                    child: Text("${snap.data!.username}",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.bold),)),
                                SizedBox(width: 20,),
                                Text("Email :${snap.data!.email}"),
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: width,
                    decoration: BoxDecoration(
                      color: Platte.hotPink,
                      borderRadius: BorderRadius.circular(8),

                    ),
                    child: Center(child: Text("Your current  balance ${snap.data!.totalMoney}",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,color:Platte.primary),)),
                  ),
                  SizedBox(height: height*0.04,),
                  Container(
                    height: height*0.2,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.04,),
                      Row(
                        children: [
                          SizedBox(
                            width: width*0.4,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Platte.hotPink
                                ),
                                  onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Recargehistory()));
                                  }, child: Text("Recarge Hestory"))),
                          Spacer(),
                          SizedBox(
                              width: width*0.4,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Platte.light
                                  ),
                                  onPressed: (){}, child: Text("Withdraw Hestory"))),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width*0.4,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Platte.primary
                                  ),
                                  onPressed: (){}, child: Text("Support"))),
                          Spacer(),
                          SizedBox(
                              width: width*0.4,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Platte.primary
                                  ),
                                  onPressed: (){}, child: Text("Copy Refar code"))),
                        ],
                      ),

                      ],
                    ),
                  ),
                  ),
                  SizedBox(height: height*0.03,),
                  SizedBox(
                    width: width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                        onPressed:  ()async{
                      await auth.signOut();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
          }, child: Text("Log out")),
                  )
                ],
              ),
            ):CupertinoActivityIndicator();
          }
      ),
    );
  }
}

