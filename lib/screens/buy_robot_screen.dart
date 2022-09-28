import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/mls/botmodel.dart';
import 'package:jadeais/mls/profilemodel.dart';
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
      drawer: Drawer(child: SliderView()),
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: CircleAvatar(
                radius: 14,
                backgroundColor: const Color.fromARGB(255, 91, 95, 97),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/user-solid.svg",
                    color: Colors.white,
                  ),
                )),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.bell,
                color: Colors.black,
              ))
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
                        height: height * 0.18,
                        width: width * 8,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text("Buy robot",
                                                    style: GoogleFonts.lato(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: width * 0.02),
                                                child: Text(
                                                  "purchase price",
                                                  style: GoogleFonts.lato(
                                                      color: Colors.black38),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      bot.price.toString(),
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
                                                      bot.price.toString(),
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
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: width * 0.09),
                                                child: RobotBuyDetails(
                                                    width: width,
                                                    height: height,
                                                    robotPrice: bot.price.toString(),
                                                    robotWorkingDays: bot.daily_add.toString(),
                                                    startupDeposit: bot.daily_add.toString()),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: width * 0.02),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Please enter the quantity to buy",
                                                          style: GoogleFonts.lato(
                                                              color: Colors.black,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                buyRobotAmount++;
                                                              });
                                                            },
                                                            icon: Icon(
                                                                FontAwesomeIcons.plus)),
                                                        Container(
                                                          height: height * 0.03,
                                                          width: width * 0.08,
                                                          color: Colors.white,
                                                          child: Center(
                                                              child: Text(
                                                                  "${buyRobotAmount}")),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                buyRobotAmount--;
                                                              });
                                                            },
                                                            icon: Icon(FontAwesomeIcons
                                                                .minus)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Center(
                                                child: ElevatedButton(
                                                    onPressed: () async{
                                                      if(p.data!.totalMoney>=bot.price!){

                                                        await fireBase.buyRobot(p.data!, bot);
                                                      }else{
                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Not enough money, recharge")));
                                                      }
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const BuyRobot()),
                                                      );
                                                      var snackBar = SnackBar(
                                                        elevation: 0,
                                                        behavior:
                                                            SnackBarBehavior.floating,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        content: AwesomeSnackbarContent(
                                                          title: 'Succesfully send!',
                                                          message:
                                                              'Thank you sir our team will response soon',
                                                          contentType:
                                                              ContentType.success,
                                                        ),
                                                      );

                                                      ScaffoldMessenger.of(context)
                                                          .showSnackBar(snackBar);
                                                    },
                                                    child: Text(
                                                        "Confirm to active robot")),
                                              )
                                            ],
                                          ),
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
                    child: Text("u",
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
          color: Colors.black,
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
                  child: Text("u",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                )
              ],
            ),
            Text("Startup\n deposit",
                style: GoogleFonts.lato(
                    color: Colors.black38,
                    fontSize: 10,
                    fontWeight: FontWeight.w800))
          ],
        ),
      ],
    );
  }
}
