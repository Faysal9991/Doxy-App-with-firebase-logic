import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/mls/botmodel.dart';
import 'package:jadeais/mls/profilemodel.dart';
import 'package:jadeais/screens/new_recharge_screen.dart';
import 'package:jadeais/screens/new_withdraw_screen.dart';


import '../../../widgtes/slider_view.dart';
import '../../robot details/robot_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  FireBase fireBase = FireBase();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(child: SliderView()),
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
              icon: const Icon(
                FontAwesomeIcons.bell,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      body: StreamBuilder<Profile>(
        stream: fireBase.myProfileStream(),
        builder: (context,snap) {
          return snap.hasData?Column(
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: width,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: width * 0.05, top: height * 0.015),
                      child: Container(
                        height: height * 0.03,
                        width: width * 0.3,
                        child: Row(
                          children: [
                            Text(
                              "Total assets",
                              style: GoogleFonts.lato(
                                  color: Colors.black45, fontSize: 14),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Icon(
                              FontAwesomeIcons.eye,
                              size: width * 0.04,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.35,
                      ),
                      child: FutureBuilder<double>(
                        future: fireBase.totalAssets(),
                        builder: (context, sd) {
                          return sd.hasData?Row(
                            children: [
                              Text(
                                "${sd.data!}",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                "BDT",
                                style: GoogleFonts.lato(
                                    color: Colors.black45,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Icon(
                                FontAwesomeIcons.angleDown,
                                size: width * 0.04,
                              )
                            ],
                          ):Center(child: CircularProgressIndicator(),);
                        }
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.24,
                      ),
                      child: FutureBuilder<double>(
                        future: fireBase.todaytotalincomefrombots(),
                        builder: (context, d) {
                          return d.hasData?Row(

                            children: [
                              Text(
                                "Taday's earning's",
                                style: GoogleFonts.lato(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${d.data}",
                                style:
                                    GoogleFonts.lato(color: Colors.black, fontSize: 14),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                "+36.56%",
                                style: GoogleFonts.lato(
                                    color: Colors.greenAccent, fontSize: 14),
                              ),
                            ],
                          ):Center(child: CircularProgressIndicator(),);
                        }
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: height * 0.02, left: width * 0.1),
                      child: FutureBuilder<double>(
                         future: fireBase.todaytotalincomefrombots(),
                        builder: (context, d) {
                          return Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              profileEarnig(
                                  height: height,
                                  days: "7 Days",
                                  money: "${d.data!*7} BDT",
                                  parcent: "+42%"),
                              SizedBox(
                                width: width * 0.09,
                              ),
                              profileEarnig(
                                  height: height,
                                  days: "30 Days",
                                  money: "${d.data!*30} BDT",
                                  parcent: "+92%"),
                              SizedBox(
                                width: width * 0.09,
                              ),
                              profileEarnig(
                                  height: height,
                                  days: "All",
                                  money: "${d.data!*60} BDT",
                                  parcent: "+432%"),
                              SizedBox(width: width*0.1,)
                            ],
                          );
                        }
                      ),
                    ),
                    SizedBox(height: height*0.01,)
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.54,
                width: width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: width * 0.02, top: height * 0.01),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RobotDetails(myProfile: snap.data!,)));
                        },
                        child: Container(
                          height: height * 0.05,
                          width: width * 0.94,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 225, 225),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.02,
                              ),
                              const Icon(
                                FontAwesomeIcons.robot,
                                size: 13,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              FutureBuilder<List<Bot>>(
                                  future: fireBase.allmyactivebot(),
          builder: (context, snap) {
          return  Text(
          "Number of robots at work ${snap.data!.length.toString()}",
          style: TextStyle(color: Colors.black),
          );
          }),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width * 0.04, top: height * 0.01),
                      child: Row(
                        children: [
                          SizedBox(
                              width: width * 0.43,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RechargeScreen()));
                                  },
                                  child: Text("Recharge"))),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          SizedBox(
                              width: width * 0.43,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.greenAccent),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WithdrawScreen()));
                                  },
                                  child: Text("Withdraw")))
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width * 0.02, top: height * 0.01),
                      child: Text(
                        "Icome Details",
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                     SizedBox(height: height*.02,),
                    FutureBuilder<double>(

                        future: fireBase.todaytotalincomefrombots(),
                      builder: (context, d) {
                        return Belowlist(
                          h: height,
                          w: width,
                          iconname: FontAwesomeIcons.sackDollar,
                          iconDetais: "Robot income total",
                          blance: "${d.data} BDT");
                      }
                    ),
                      SizedBox(height: height*.02,),
                       Belowlist(
                      h: height,
                      w: width,
                      iconname: FontAwesomeIcons.flask,
                      iconDetais: "Cumulstive robot\n income",
                      blance: "000 BDT"),
                       SizedBox(height: height*.02,),
                       Belowlist(
                      h: height,
                      w: width,
                      iconname: FontAwesomeIcons.magnifyingGlassDollar,
                      iconDetais: "yestarday's agent\n income",
                      blance: "000 BDT"),
                       SizedBox(height: height*.02,),
                       Belowlist(
                      h: height,
                      w: width,
                      iconname: FontAwesomeIcons.magnifyingGlassChart,
                      iconDetais: "Accumulative agent\n income",
                      blance: "000 BDT"),
                  ],
                ),
              )
            ],
          ):Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}

class Belowlist extends StatelessWidget {
  const Belowlist({
    Key? key,
    required this.iconname,
    required this.iconDetais,
    required this.blance,
    required this.h,
    required this.w,
  }) : super(key: key);
  


  
  final double h;

  final double w;
  final IconData iconname;
  final String iconDetais;
  final String blance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
   
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(iconname,size: w*0.06,color: Colors.green,),
          SizedBox(width:w*0.01),
          Padding(
            padding:  EdgeInsets.only(top: h*0.01),
            child: Text(iconDetais,style: GoogleFonts.lato(color: Colors.black45),),
          ),
          Spacer(),
          Padding(
             padding:  EdgeInsets.only(top: h*0.01,right: w*0.03),
            child: Text(blance,style: GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}

class profileEarnig extends StatelessWidget {
  const profileEarnig(
      {Key? key,
      required this.height,
      required this.days,
      required this.money,
      required this.parcent})
      : super(key: key);

  final double height;
  final String days;
  final String money;
  final String parcent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          days,
          style:
              GoogleFonts.lato(color: const Color.fromARGB(255, 162, 159, 159)),
        ),
        SizedBox(
          height: height * 0.005,
        ),
        Text(
          money,
          style: GoogleFonts.lato(color: Colors.black),
        ),
        SizedBox(
          height: height * 0.005,
        ),
        Text(
          parcent,
          style: GoogleFonts.lato(color: Colors.greenAccent),
        )
      ],
    );
  }
}
