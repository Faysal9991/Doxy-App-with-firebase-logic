import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/mls/botmodel.dart';
import 'package:jadeais/mls/profilemodel.dart';
import 'package:jadeais/utils/color_plate.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widgtes/slider_view.dart';

class BuyRobot extends StatefulWidget {
  const BuyRobot({super.key});

  @override
  State<BuyRobot> createState() => _BuyRobotState();
}

class _BuyRobotState extends State<BuyRobot> {
  int buyRobotAmount = 0;
  FireBase fireBase = FireBase();
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //ca-app-pub-3940256099942544/1033173712
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
            _interstitialAd?.show();

          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Platte.primary,
        actions: [
          SizedBox(width: 10,),

          SizedBox(width: width*0.1,),
          Center(child: Text("Doxi",style:GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
          const Spacer(),
          IconButton(onPressed: (){},
              icon: Icon(FontAwesomeIcons.bell))
        ],
      ),
      body: FutureBuilder<Profile>(
        future: fireBase.myProfile(),
        builder: (context, p) {
          return p.hasData?StreamBuilder<List<Bot>>(
            stream: fireBase.allthebots(),
            builder: (context, snap) {
              return snap.hasData?ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    Bot bot = snap.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        width: width * 8,
                        decoration: BoxDecoration(color: Platte.hotPink,borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.04, top: height * 0.01),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.robot,
                                    size: 16,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    "Robot No 1",
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            ),
                            RobotBuyDetails(
                                width: width,
                                height: height,
                                robotPrice: bot.price.toString(),
                                robotWorkingDays: bot.active_days.toString(),
                                startupDeposit: bot.daily_add.toString()),
                            SizedBox(
                                height: height * 0.043,
                                width: width * 0.9,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Platte.primary
                                  ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title:  Text("Do you Want to active robot"),

                                          actions:[
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red
                                              ),
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: const Text("Cancel"),
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.green
                                                ),
                                                onPressed: () async{
                                                  if(p.data!.totalMoney>=bot.price!){

                                                    await fireBase.buyRobot(p.data!, bot);
                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Robot is activated")));
                                                    Navigator.of(ctx).pop();
                                                  }else{
                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Not enough money, recharge")));
                                                    Navigator.of(ctx).pop();
                                                  }
                                                },
                                                child: Text(
                                                    "Confirm")),

                                          ],
                                        ),
                                      );
                                    },
                                    child: Text("Buy Now")))
                          ],
                        ),
                      ),
                    );
                  }):Center(child: CircularProgressIndicator(),);
            }
          ):Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}

class RobotBuyDetails extends StatelessWidget {
  const RobotBuyDetails(
      {Key? key,
      required this.width,
      required this.height,
      required this.robotPrice,
      required this.robotWorkingDays,
      required this.startupDeposit})
      : super(key: key);

  final double width;
  final double height;

  final String robotPrice;
  final String robotWorkingDays;
  final String startupDeposit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(robotPrice,
                      style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.005, left: width * 0.005),
                    child: Text("BDT",
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                  )
                ],
              ),
              Text("Robot Price",
                  style: GoogleFonts.lato(
                      color: Colors.black38,
                      fontSize: 10,
                      fontWeight: FontWeight.w800))
            ],
          ),
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Container(
          height: height * 0.1,
          width: width * 0.003,
          color: Colors.white,
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Column(
          children: [
            Row(
              children: [
                Text(robotWorkingDays,
                    style: GoogleFonts.oswald(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800)),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.005, left: width * 0.005),
                  child: Text("day",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                )
              ],
            ),
            Text("Expiratio\nn date",
                style: GoogleFonts.lato(
                    color: Colors.black38,
                    fontSize: 10,
                    fontWeight: FontWeight.w800))
          ],
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Container(
          height: height * 0.1,
          width: width * 0.003,
          color: Colors.black,
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Column(
          children: [
            Row(
              children: [
                Text(startupDeposit,
                    style: GoogleFonts.oswald(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800)),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.005, left: width * 0.005),
                  child: Text("BDT",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                )
              ],
            ),

          ],
        ),
      ],
    );
  }
}
