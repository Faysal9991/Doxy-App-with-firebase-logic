import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/helper/authhelper.dart';

import 'package:jadeais/screens/robot%20details/robot_screen.dart';
import 'package:jadeais/widgtes/home_page_help_widget.dart';

import '../../../mls/profilemodel.dart';
import '../../../widgtes/slider_view.dart';
import '../../Buy robot/buy_robot_screen.dart';
import '../../home page Bottom options/about.dart';
import '../../home page Bottom options/gudie.dart';
import '../../home page Bottom options/support.dart';

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
      drawer: Drawer(child: SliderView()),
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        title: Text(
          "Doxy",
          style: GoogleFonts.oswald(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
              icon: const Icon(
                FontAwesomeIcons.bell,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<Profile>(
            stream: fireBase.myProfileStream(),
            builder: (context, snap) {
              print(snap.error);
              return snap.hasData
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            height: height * 0.2,
                            width: width * 0.94,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff3293F5),
                                    Color(0xff51BFB3),
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
                                        color: Colors.teal,
                                        size: 14,
                                      ),
                                      SizedBox(width: width * 0.01),
                                      const Text(
                                        "Jade Ai",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "বন্ধুদের আমন্ত্রণ  জানান",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: height * 0.016,
                                        ),
                                        const Text(
                                          "দশ মিলিয়ন বেনাস পান",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: height * 0.15,
                                      width: width * 0.22,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/phone.png"),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.43),
                            child: Row(
                              children: [
                                Container(
                                  height: height * 0.008,
                                  width: width * 0.04,
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
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
                            height: height * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RobotDetails(
                                        myProfile: snap.data!,
                                      )));
                            },
                            child: Container(
                              height: height * 0.05,
                              width: width * 0.94,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
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
                                  const Text(
                                    "Number of robots at work",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child: Container(
                              height: height * 0.3,
                              width: width,
                              decoration:
                                  const BoxDecoration(color: Colors.white54),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "আজ আনুমানিক  আয়",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    FutureBuilder<double>(
                                        future:
                                            fireBase.todaytotalincomefrombots(),
                                        builder: (context, snap) {
                                          return snap.hasData
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      "${snap.data}",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.01,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: height * .007),
                                                      child: const Text(
                                                        "USDT=",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    126,
                                                                    122,
                                                                    122),
                                                            fontSize: 13),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.01,
                                                    ),
                                                    Text(
                                                      "${snap.data}",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.01,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: height * .007),
                                                      child: const Text(
                                                        "BDT",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    126,
                                                                    122,
                                                                    122),
                                                            fontSize: 13),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height * 0.05,
                                        width: width,
                                        child: Expanded(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 5,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  height: 10,
                                                  width: 10,
                                                  color: Colors.amber,
                                                );
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * 0.2,
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(9)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          padding: EdgeInsets.only(
                                              left: width * 0.02),
                                          child: Text(
                                              "Buy Ai robots, active\n to get high rewards,\n and make money\n easily",
                                              style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontSize: 13,
                                              )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.02),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.white),
                                              onPressed: () {
                                                Get.to(const BuyRobot());
                                              },
                                              child: Text(
                                                "Buy Now",
                                                style: GoogleFonts.lato(
                                                    color: Colors.black),
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
                                                Colors.teal,
                                                Colors.black,
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        child: Center(
                                            child: Text(
                                          "Here me",
                                          style: GoogleFonts.ebGaramond(
                                              color: Colors.white),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        padding:
                                            EdgeInsets.only(left: width * 0.05),
                                        child: Row(
                                          children: [
                                            HelpWidget(
                                                height: height,
                                                width: width,
                                                svgname: "assets/question.svg",
                                                iconName: "guide",
                                                gotoScreenName: () {
                                                  Get.to(const GuideScreen());
                                                }),
                                            SizedBox(
                                              width: width * 0.1,
                                            ),
                                            HelpWidget(
                                                height: height,
                                                width: width,
                                                svgname: "assets/hand.svg",
                                                iconName: "support",
                                                gotoScreenName: () {
                                                  Get.to(const SupportScreen());
                                                }),
                                            SizedBox(
                                              width: width * 0.1,
                                            ),
                                            HelpWidget(
                                                height: height,
                                                width: width,
                                                svgname: "assets/message.svg",
                                                iconName: "share",
                                                gotoScreenName: () {}),
                                            SizedBox(
                                              width: width * 0.1,
                                            ),
                                            HelpWidget(
                                                height: height,
                                                width: width,
                                                svgname: "assets/person.svg",
                                                iconName: "About",
                                                gotoScreenName: () {
                                                  Get.to(const AboutScreen());
                                                }),
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}
