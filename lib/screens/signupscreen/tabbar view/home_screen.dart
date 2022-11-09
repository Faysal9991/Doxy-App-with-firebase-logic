import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/helper/coin_model.dart';
import 'package:jadeais/mls/botmodel.dart';
import 'package:jadeais/screens/gudie.dart';
import 'package:jadeais/screens/robot%20details/robot_screen.dart';
import 'package:jadeais/screens/support.dart';
import 'package:jadeais/utils/color_plate.dart';
import 'package:jadeais/widgtes/home_page_help_widget.dart';
import '../../../mls/profilemodel.dart';
import '../../../widgtes/coin_card.dart';
import '../../../widgtes/slider_view.dart';
import '../../about.dart';
import '../../buy_robot_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FireBase fireBase = FireBase();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Platte.background,

      body: SafeArea(
        child: StreamBuilder<Profile>(
          stream: fireBase.myProfileStream(),
          builder: (context, snap) {
            print(snap.error);
            return snap.hasData?SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.2,
                    width: width * 0.94,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [
                            Platte.primary,
                            Platte.light,

                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.robot,
                                color: Platte.hotPink,
                                size: 14,
                              ),
                              SizedBox(width:10),
                              const Text(
                                "Doxi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.23,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  "Invite your friends",
                                  style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
                                ),
                                SizedBox(
                                  height: height * 0.016,
                                ),
                                 Text(
                                  "Get 10 million bonus",
                                  style:
                                      GoogleFonts.lato(
                                          color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                            Container(
                              height: height * 0.15,
                              width: width * 0.22,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/phone.png"),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.43),
                    child: Row(
                      children: [
                        Container(
                          height: height * 0.008,
                          width: width * 0.04,
                          decoration: BoxDecoration(
                              color: Platte.primary,
                              borderRadius: BorderRadius.circular(7)),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Container(
                          height: height * 0.008,
                          width: width * 0.04,
                          decoration: BoxDecoration(
                              color: const Color(0xffCADBFD),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Container(
                          height: height * 0.008,
                          width: width * 0.04,
                          decoration: BoxDecoration(
                              color: const Color(0xffCADBFD),
                              borderRadius: BorderRadius.circular(7)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      if(snap.data!= null){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RobotDetails(myProfile: snap.data!,)));
                      }else{
                        CircularProgressIndicator();
                      }

                    },
                    child: Container(
                      height: height * 0.05,
                      width: width * 0.94,
                      decoration: BoxDecoration(
                          color: Platte.primary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          const Icon(
                            FontAwesomeIcons.robot,
                            size: 13,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          FutureBuilder<List<Bot>>(
        future: fireBase.allmyactivebot(),
    builder: (context, snap) {
      return  snap.data==null?Text("loading",style: TextStyle(color: Colors.white),):Text(
        "Number of robots at work ${snap.data!.length.toString()}",
        style: TextStyle(color: Colors.white),
      );
    }),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.03),
                    child: Container(
                      height: height * 0.1,
                      width: width,
                      decoration:  BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              "Estimated income today",
                              style: GoogleFonts.lato(
                                  color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            FutureBuilder<double>(
                              future: fireBase.todaytotalincomefrombots(),
                              builder: (context, snap) {
                                return snap.hasData?Row(
                                  children: [

                                    Text(
                                      "${snap.data}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: height * .007),
                                      child: const Text(
                                        "BDT",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 126, 122, 122),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ):Center(child: CupertinoActivityIndicator(),);
                              }
                            ),

                           ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height * 0.2,
                      width: width,
                      decoration: BoxDecoration(
                          color: Platte.primary,
                          borderRadius: BorderRadius.circular(9)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Robot Buying USDT",
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.02),
                                  child: Text(
                                      "Buy Ai robots, active\n to get high rewards,\n and make money\n easily",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 13,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.02),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BuyRobot()));
                                        },
                                      child: Text(
                                        "Buy Now",
                                        style:
                                            GoogleFonts.lato(color: Colors.black),
                                      )),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: height * 0.19,
                                width: width * 0.2,
                                child: Image.asset(
                                  "assets/robot.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              const Icon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Container(
                                height: height * 0.04,
                                width: width * 0.17,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Platte.primary,
                                        Platte.light,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(2)),
                                child: Center(
                                    child: Text(
                                  "Here me",
                                  style:
                                      GoogleFonts.ebGaramond(color: Colors.white),
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height * 0.13,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Help",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.05),
                                child: Row(

                                  children: [
                                    HelpWidget(
                                        height: height,
                                        width: width,
                                      svgname: "assets/question.svg",
                                      iconName: "guide",
                                       gotoScreenName: (){
                                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GuideScreen()));
                                       }),
                                       SizedBox(width: width*0.1,),
                                       HelpWidget(
                                        height: height,
                                        width: width,
                                      svgname: "assets/hand.svg",
                                      iconName: "support",
                                       gotoScreenName: (){
                                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SupportScreen()));
                                       }),
                                        SizedBox(width: width*0.1,),
                                       HelpWidget(
                                          height: height,
                                        width: width,
                                      svgname: "assets/message.svg",
                                      iconName: "about",
                                       gotoScreenName: (){
                                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutScreen()));
                                       }),
                                        SizedBox(width: width*0.1,),
                                       HelpWidget(
                                          height: height,
                                        width: width,
                                      svgname: "assets/person.svg",
                                      iconName: "profile",
                                       gotoScreenName: (){}),

                                    ],
                                ),
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ):Center(child: CircularProgressIndicator(),);
          }
        ),
      ),
    

      );
      }
}
