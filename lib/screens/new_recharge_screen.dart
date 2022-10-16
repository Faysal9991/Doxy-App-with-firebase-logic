


import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/mls/mainadminmodel.dart';
import 'package:jadeais/mls/rechargemodel.dart';


class RechargeScreen extends StatefulWidget {
  const RechargeScreen({Key? key}) : super(key: key);

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  FireBase fireBase = FireBase();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController transaction = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController numberController = TextEditingController();

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Recharge",
                style: GoogleFonts.oleoScript(color: Colors.white)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                     InkWell(
                    onTap: () {
                      showDialog(
                  context: context,
                  builder: (ctx) => StreamBuilder<MainAdminModel>(
                    stream: fireBase.mainAdminData(),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        return AlertDialog(
                        title: const Text("Bkash Deposit option"),

                        actions:[
                             Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [

                                   SizedBox(height: height*0.03,),
                                    Row(
                                      children: [
                                          Text("মিনিমাম ডিপোজিট ৳20",style: GoogleFonts.lato(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                                          Container(
                                            height: height*0.03,
                                            width: width*0.4,
                                          decoration: BoxDecoration(  color: Colors.white,
                                          borderRadius: BorderRadius.circular(8)),
                                            child:  Padding(
                                              padding:  EdgeInsets.only(top: height*0.01),
                                              child: TextField(
                                                controller: amount,
                                                inputFormatters: [
        LengthLimitingTextInputFormatter(11),
      ],
                                                textAlign: TextAlign.center,
                                                 style: const TextStyle(color: Colors.black),
                                                decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Entre ammount",
                                                  hintStyle: TextStyle(color: Colors.black)
                                                ),

                                              ),
                                            ),
                                          )
                                      ],
                                    ),


          SizedBox(height: height*0.03,),

                                      Row(
                                      children: [
                                          Text("আপনে যে\n বিকাশ নাম্বার-\n থেকে টাকা পাঠাবেন সেই \nনাম্বার টি লিখুন ",style: GoogleFonts.lato(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                                          Container(
                                            height: height*0.03,
                                            width: width*0.4,
                                             decoration: BoxDecoration(  color: Colors.white,
                                          borderRadius: BorderRadius.circular(8)),
                                            child:  Padding(
                                               padding:  EdgeInsets.only(top: height*0.01),
                                              child: TextField(

                                                  inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
                                                textAlign: TextAlign.center,
                                                 controller: numberController,
                                                 style: const TextStyle(color: Colors.black),
                                                decoration: const InputDecoration(
                                                  hintText: "Entre number",
                                                  hintStyle: TextStyle(color: Colors.black)
                                                ),

                                              ),
                                            ),
                                          )
                                      ],
                                    )
                      ,
              Text("নিচে দেওয়া নাম্বারটি পার্সোনাল নাম্বার।\n নাম্বার টি কপি করে সেন্ড মানি করুন",style: GoogleFonts.lato(color: Colors.black,
              fontSize: 10,fontWeight: FontWeight.w500)),
              InkWell(
                onTap: (){

                    Clipboard.setData(ClipboardData(text: "${snap.data!.bkash}"));
                    var snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Copied!',
                        message:
                        'THanks to copy',
                        contentType: ContentType.success,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      snackBar,
                    );

                },
                child: Text("${snap.data!.bkash}",style: GoogleFonts.lato(color: Colors.black,
                fontSize: 17,fontWeight: FontWeight.w500),),
              ),
          SizedBox(height: height*0.03,),

              Row(
                                      children: [
                                          Text("টাকা পাঠানোর পর -\nযে TRX ID টি পেয়েছেন-\n তা লিখুন",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                          Container(
                                            height: height*0.08,
                                            width: width*0.4,
                                            decoration: BoxDecoration(  color: Colors.white,
                                          borderRadius: BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:  EdgeInsets.only(top: height*0.01),
                                              child:  TextField(
                                                controller: transaction,
                                                textAlign: TextAlign.center,
                                                 style: TextStyle(color: Colors.black),
                                                decoration: InputDecoration(
                                                  hintText: "Entre transaction number",
                                                  hintStyle: TextStyle(color: Colors.black)
                                                ),

                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                      ElevatedButton(onPressed: ()async{
                        if(numberController.text.length !=11){
                       var snakBar=SnackBar(content: Text("Rong number")
                       );
                       ScaffoldMessenger.of(context).showSnackBar(
                         snakBar,
                       );
                        }
                          if (amount.text.isEmpty) {
                                        var snackBar = SnackBar(
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: 'Empty Error!',
                                            message:
                                            'Please fill the ammount then select pyment mathod!',
                                            contentType: ContentType.failure,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          snackBar,
                                        );
                                      } else {

                                        await fireBase.rechargeTobalance(amount.text.trim(), transaction.text.trim());

                                        var snackBar = SnackBar(
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: 'On Thanks!',
                                            message:
                                            'Recharge requested Successfully, wait for verification',
                                            contentType: ContentType.help,
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }

                          Navigator.of(context, rootNavigator: true).pop('dialog');

                      }, child: const Text("Submit"))

                                  ],
                                ),
                              ),


                        ],
                      );
                      } else {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }
                  ),
                );
                    },
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage("assets/bkash.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
               
               
               
               /*.................................nogod.......................*/





                 InkWell(
                   onTap: () {
                     showDialog(
                       context: context,
                       builder: (ctx) => StreamBuilder<MainAdminModel>(
                           stream: fireBase.mainAdminData(),
                           builder: (context, snap) {
                             if (snap.hasData) {
                               return   AlertDialog(
                                 title: const Text("Rocket Deposit option"),

                                 actions:[
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Column(
                                       children: [

                                         Row(
                                           children: [
                                             Text("মিনিমাম ডিপোজিট ৳20",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                             Container(
                                               height: height*0.03,
                                               width: width*0.4,
                                               decoration: BoxDecoration(  color: Colors.white,
                                                   borderRadius: BorderRadius.circular(8)),
                                               child:  Padding(
                                                 padding:  EdgeInsets.only(top: height*0.01),
                                                 child: TextField(
                                                   inputFormatters: [
                                                     LengthLimitingTextInputFormatter(11),
                                                   ],
                                                   textAlign: TextAlign.center,
                                                   style: const TextStyle(color: Colors.black),
                                                   decoration: const InputDecoration(
                                                       border: InputBorder.none,
                                                       hintText: "Entre ammount",
                                                       hintStyle: TextStyle(color: Colors.black)
                                                   ),

                                                 ),
                                               ),
                                             )
                                           ],
                                         ),


                                         SizedBox(height: height*0.03,),

                                         Row(
                                           children: [
                                             Text("আপনে যে\n বিকাশ নাম্বার-\n থেকে টাকা পাঠাবেন সেই \nনাম্বার টি লিখুন ",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                             Container(
                                               height: height*0.03,
                                               width: width*0.4,
                                               decoration: BoxDecoration(  color: Colors.white,
                                                   borderRadius: BorderRadius.circular(8)),
                                               child:  Padding(
                                                 padding:  EdgeInsets.only(top: height*0.01),
                                                 child: TextField(
                                                   inputFormatters: [
                                                     LengthLimitingTextInputFormatter(15),
                                                   ],
                                                   textAlign: TextAlign.center,
                                                   style: const TextStyle(color: Colors.black),
                                                   decoration: const InputDecoration(
                                                       hintText: "Entre number",
                                                       hintStyle: TextStyle(color: Colors.black)
                                                   ),

                                                 ),
                                               ),
                                             )
                                           ],
                                         )
                                         ,
                                         Text("নিচে দেওয়া নাম্বারটি পার্সোনাল নাম্বার।\n নাম্বার টি কপি করে সেন্ড মানি করুন",style: GoogleFonts.lato(color: Colors.black,
                                             fontSize: 9,fontWeight: FontWeight.w500)),
                                         Text("${snap.data!.rocket}",style: GoogleFonts.lato(color: Colors.white,
                                             fontSize: 9,fontWeight: FontWeight.w500),),
                                         SizedBox(height: height*0.03,),

                                         Row(
                                           children: [
                                             Text("টাকা পাঠানোর পর -\nযে TRX ID টি পেয়েছেন-\n তা লিখুন",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                             Container(
                                               height: height*0.08,
                                               width: width*0.4,
                                               decoration: BoxDecoration(  color: Colors.white,
                                                   borderRadius: BorderRadius.circular(8)),
                                               child: Padding(
                                                 padding:  EdgeInsets.only(top: height*0.01),
                                                 child:  const TextField(
                                                   textAlign: TextAlign.center,
                                                   style: TextStyle(color: Colors.black),
                                                   decoration: InputDecoration(
                                                       hintText: "Entre transaction number",
                                                       hintStyle: TextStyle(color: Colors.black)
                                                   ),

                                                 ),
                                               ),
                                             )
                                           ],
                                         ),
                                         ElevatedButton(onPressed: (){
                                           Navigator.of(context, rootNavigator: true).pop('dialog');
                                         }, child: const Text("Submit"))

                                       ],
                                     ),
                                   ),


                                 ],
                               );
                             } else {
                               return Center(child: CircularProgressIndicator(),);
                             }
                           }
                       ),
                     );
                   },

                    child: Container(
                      height: height * 0.2,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                         ),
                         child: SvgPicture.asset("assets/nogod.svg"),
                    ),
                  )
                
               
               
                ],
               ),
                
                
                SizedBox(height: height*0.05,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                     InkWell(
                       onTap: () {
                         showDialog(
                           context: context,
                           builder: (ctx) => StreamBuilder<MainAdminModel>(
                               stream: fireBase.mainAdminData(),
                               builder: (context, snap) {
                                 if (snap.hasData) {
                                   return  AlertDialog(
                                     title: const Text("Nogod Deposit option"),

                                     actions:[
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Column(
                                           children: [

                                             Row(
                                               children: [
                                                 Text("মিনিমাম ডিপোজিট ৳20",style: GoogleFonts.lato(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
                                                 Container(
                                                   height: height*0.03,
                                                   width: width*0.4,
                                                   decoration: BoxDecoration(  color: Colors.white60,
                                                       borderRadius: BorderRadius.circular(8)),
                                                   child:  Padding(
                                                     padding:  EdgeInsets.only(top: height*0.01),
                                                     child: TextField(
                                                       inputFormatters: [
                                                         LengthLimitingTextInputFormatter(11),
                                                       ],
                                                       textAlign: TextAlign.center,
                                                       style: const TextStyle(color: Colors.black),
                                                       decoration: const InputDecoration(

                                                           hintText: "Entre ammount",
                                                           hintStyle: TextStyle(color: Colors.black)
                                                       ),

                                                     ),
                                                   ),
                                                 )
                                               ],
                                             ),


                                             SizedBox(height: height*0.03,),

                                             Row(
                                               children: [
                                                 Text("আপনে যে\n বিকাশ নাম্বার-\n থেকে টাকা পাঠাবেন সেই \nনাম্বার টি লিখুন ",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                                 Container(
                                                   height: height*0.03,
                                                   width: width*0.4,
                                                   decoration: BoxDecoration(  color: Colors.white,
                                                       borderRadius: BorderRadius.circular(8)),
                                                   child:  Padding(
                                                     padding:  EdgeInsets.only(top: height*0.01),
                                                     child: TextField(
                                                       inputFormatters: [
                                                         LengthLimitingTextInputFormatter(15),
                                                       ],
                                                       textAlign: TextAlign.center,
                                                       style: const TextStyle(color: Colors.black),
                                                       decoration: const InputDecoration(
                                                           hintText: "Entre number",
                                                           hintStyle: TextStyle(color: Colors.black)
                                                       ),

                                                     ),
                                                   ),
                                                 )
                                               ],
                                             )
                                             ,
                                             Text("নিচে দেওয়া নাম্বারটি পার্সোনাল নাম্বার।\n নাম্বার টি কপি করে সেন্ড মানি করুন",style: GoogleFonts.lato(color: Colors.black,
                                                 fontSize: 9,fontWeight: FontWeight.w500)),
                                             Text("${snap.data!.nagad}",style: GoogleFonts.lato(color: Colors.black,
                                                 fontSize: 9,fontWeight: FontWeight.w500),),
                                             SizedBox(height: height*0.03,),

                                             Row(
                                               children: [
                                                 Text("টাকা পাঠানোর পর -\nযে TRX ID টি পেয়েছেন-\n তা লিখুন",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                                 Container(
                                                   height: height*0.08,
                                                   width: width*0.4,
                                                   decoration: BoxDecoration(  color: Colors.white,
                                                       borderRadius: BorderRadius.circular(8)),
                                                   child: Padding(
                                                     padding:  EdgeInsets.only(top: height*0.01),
                                                     child:  const TextField(
                                                       textAlign: TextAlign.center,
                                                       style: TextStyle(color: Colors.black),
                                                       decoration: InputDecoration(
                                                           hintText: "Entre transaction number",
                                                           hintStyle: TextStyle(color: Colors.black)
                                                       ),

                                                     ),
                                                   ),
                                                 )
                                               ],
                                             ),
                                             ElevatedButton(onPressed: (){

                                               Navigator.of(context, rootNavigator: true).pop('dialog');
                                             }, child: const Text("Submit"))

                                           ],
                                         ),
                                       ),


                                     ],
                                   );
                                 } else {
                                   return Center(child: CircularProgressIndicator(),);
                                 }
                               }
                           ),
                         );
                       },


                    child: Container(
                      height: height * 0.2,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                       ),
                        child: SvgPicture.asset("assets/roket.svg"),
                    ),
                  ),
               
               
               
               /*.................................Upay.......................*/





                 InkWell(
                   onTap: () {
                     showDialog(
                       context: context,
                       builder: (ctx) => StreamBuilder<MainAdminModel>(
                           stream: fireBase.mainAdminData(),
                           builder: (context, snap) {
                             if (snap.hasData) {
                               return   AlertDialog(
                                 title: const Text("Upay Deposit option"),

                                 actions:[
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Column(
                                       children: [
                                         Row(
                                           children: [
                                             Text("মিনিমাম ডিপোজিট ৳20",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                             Container(
                                               height: height*0.03,
                                               width: width*0.4,
                                               decoration: BoxDecoration(  color: Colors.white,
                                                   borderRadius: BorderRadius.circular(8)),
                                               child:  Padding(
                                                 padding:  EdgeInsets.only(top: height*0.01),
                                                 child: TextField(
                                                   inputFormatters: [
                                                     LengthLimitingTextInputFormatter(11),
                                                   ],
                                                   textAlign: TextAlign.center,
                                                   style: const TextStyle(color: Colors.black),
                                                   decoration: const InputDecoration(
                                                       border: InputBorder.none,
                                                       hintText: "Entre ammount",
                                                       hintStyle: TextStyle(color: Colors.black)
                                                   ),

                                                 ),
                                               ),
                                             )
                                           ],
                                         ),


                                         SizedBox(height: height*0.03,),

                                         Row(
                                           children: [
                                             Text("আপনে যে\n বিকাশ নাম্বার-\n থেকে টাকা পাঠাবেন সেই \nনাম্বার টি লিখুন ",style: GoogleFonts.lato(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                                             Container(
                                               height: height*0.03,
                                               width: width*0.4,
                                               decoration: BoxDecoration(  color: Colors.white,
                                                   borderRadius: BorderRadius.circular(8)),
                                               child:  Padding(
                                                 padding:  EdgeInsets.only(top: height*0.01),
                                                 child: TextField(
                                                   inputFormatters: [
                                                     LengthLimitingTextInputFormatter(15),
                                                   ],
                                                   textAlign: TextAlign.center,
                                                   style: const TextStyle(color: Colors.black),
                                                   decoration: const InputDecoration(
                                                       hintText: "Entre number",
                                                       hintStyle: TextStyle(color: Colors.black)
                                                   ),

                                                 ),
                                               ),
                                             )
                                           ],
                                         )
                                         ,
                                         Text("নিচে দেওয়া নাম্বারটি পার্সোনাল নাম্বার।\n নাম্বার টি কপি করে সেন্ড মানি করুন",style: GoogleFonts.lato(color: Colors.black,
                                             fontSize: 9,fontWeight: FontWeight.w500)),
                                         Text("${snap.data!.upay}",style: GoogleFonts.lato(color: Colors.black,
                                             fontSize: 9,fontWeight: FontWeight.w500),),
                                         SizedBox(height: height*0.03,),

                                         Row(
                                           children: [
                                             Text("টাকা পাঠানোর পর -\nযে TRX ID টি পেয়েছেন-\n তা লিখুন",style: GoogleFonts.lato(color: Colors.white,fontSize: 9,fontWeight: FontWeight.w500),),
                                             Container(
                                               height: height*0.08,
                                               width: width*0.4,
                                               decoration: BoxDecoration(  color: Colors.white,
                                                   borderRadius: BorderRadius.circular(8)),
                                               child: Padding(
                                                 padding:  EdgeInsets.only(top: height*0.01),
                                                 child:  const TextField(
                                                   textAlign: TextAlign.center,
                                                   style: TextStyle(color: Colors.black),
                                                   decoration: InputDecoration(
                                                       hintText: "Entre transaction number",
                                                       hintStyle: TextStyle(color: Colors.black)
                                                   ),

                                                 ),
                                               ),
                                             )
                                           ],
                                         ),
                                         ElevatedButton(onPressed: (){
                                           Navigator.of(context, rootNavigator: true).pop('dialog');
                                         }, child: const Text("Submit"))

                                       ],
                                     ),
                                   ),


                                 ],
                               );
                             } else {
                               return Center(child: CircularProgressIndicator(),);
                             }
                           }
                       ),
                     );
                   },

                    child: Container(
                      height: height * 0.2,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                         ),
                         child: Image.network("https://sgp1.digitaloceanspaces.com/cosmosgroup/news/6986535_New%20Project%20(98).jpg"),
                    ),
                  )
                
               
               
                ],
               )
               
                ],
              ),
            ),
          )),
    );
  }
}
