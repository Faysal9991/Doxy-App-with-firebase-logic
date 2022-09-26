import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/mls/withdrawmodel.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({super.key});
  TextEditingController textEditingController = TextEditingController();
  TextEditingController phone = TextEditingController();
  FireBase fireBase = FireBase();
  @override
  Widget build(BuildContext context) {

    @override
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Withdraw",
          style: GoogleFonts.lato(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (() {
            FocusScope.of(context).requestFocus(FocusNode());
          }),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: height * 0.08,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Balance",
                            style: GoogleFonts.lato(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: Row(
                            children: [
                              Text(
                                "40.74",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                "USDT=",
                                style: GoogleFonts.lato(
                                    color: const Color.fromARGB(
                                        255, 108, 107, 107)),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                "40.74",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text("BDT",
                                  style: GoogleFonts.lato(
                                    color: const Color.fromARGB(
                                        255, 108, 107, 107),
                                  ))
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  height: height * 0.7,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Withdraw ammount",
                        style: GoogleFonts.lato(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        height: height * 0.05,
                        width: width * 9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.black)),
                        child: TextFormField(
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 6, right: 6),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none,
                              hintText: "Input your deposit ammount"),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: Text(
                          "Select pyment mathod",
                          style: GoogleFonts.lato(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: SizedBox(
                            width: width * 0.9,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink),
                                onPressed: () {
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(
                                      height: height * 0.5,
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Text("Wellcome",
                                              style: GoogleFonts.lato(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          TextFormField(
                                            decoration: InputDecoration(
                                                hintText:
                                                "Input Your Baksh number"),
                                          ),
                                          ElevatedButton(
                                              onPressed: () async{
                                                WithdrawModel withdraw = WithdrawModel(uid: FirebaseAuth.instance.currentUser!.uid, amount: double.parse(textEditingController.text.trim()),number: phone.text.trim() );
                                                await fireBase.withdrawRequest(withdraw);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => WithdrawScreen()),
                                                );
                                                var snackBar = SnackBar(
                                                  elevation: 0,
                                                  behavior: SnackBarBehavior.floating,
                                                  backgroundColor: Colors.transparent,
                                                  content: AwesomeSnackbarContent(
                                                    title: 'Succesfully send!',
                                                    message:
                                                    'Thank you sir our team will response soon',
                                                    contentType: ContentType.success,
                                                  ),
                                                );

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                              child: Text("send"))
                                        ],
                                      ),
                                    ),
                                  );

                                },
                                child: const Text("Bekash"))),
                      ),

                      /*...........................nogod..................*/

                      Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: SizedBox(
                            width: width * 0.9,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrange),
                                onPressed: () {
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(
                                      height: height * 0.5,
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Text("Wellcome",
                                              style: GoogleFonts.lato(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          TextFormField(
                                            controller: phone,
                                            decoration: InputDecoration(
                                                hintText:
                                                "Input Your number where to send"),
                                          ),
                                          ElevatedButton(
                                              onPressed: () async{

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => WithdrawScreen()),
                                                );
                                                var snackBar = SnackBar(
                                                  elevation: 0,
                                                  behavior: SnackBarBehavior.floating,
                                                  backgroundColor: Colors.transparent,
                                                  content: AwesomeSnackbarContent(
                                                    title: 'Succesfully send!',
                                                    message:
                                                    'Thank you sir our team will response soon',
                                                    contentType: ContentType.success,
                                                  ),
                                                );

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                              child: Text("send"))
                                        ],
                                      ),
                                    ),
                                  );

                                },
                                child: const Text("Nogod"))),
                      ),

                      /*...........................rocket..................*/

                      Padding(
                        padding: EdgeInsets.only(left: width * 0.02),
                        child: SizedBox(
                            width: width * 0.9,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 158, 10, 174)),
                                onPressed: () {
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(
                                      height: height * 0.5,
                                      width: width,
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Text("Wellcome",
                                              style: GoogleFonts.lato(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          TextFormField(
                                            decoration: InputDecoration(
                                                hintText:
                                                "Input Your Rocket number"),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => WithdrawScreen()),
                                                );
                                                var snackBar = SnackBar(
                                                  elevation: 0,
                                                  behavior: SnackBarBehavior.floating,
                                                  backgroundColor: Colors.transparent,
                                                  content: AwesomeSnackbarContent(
                                                    title: 'Succesfully send!',
                                                    message:
                                                    'Thank you sir our team will response soon',
                                                    contentType: ContentType.success,
                                                  ),
                                                );

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                              child: Text("send"))
                                        ],
                                      ),
                                    ),
                                  );

                                },
                                child: const Text("Roket"))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}