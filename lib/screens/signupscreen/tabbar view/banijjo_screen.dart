import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/widgtes/slider_view.dart';
import 'package:jadeais/widgtes/trade_widget.dart';

class BanijjoScreen extends StatelessWidget {
  const BanijjoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer:  Drawer(child: SliderView()),
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
                icon: const Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: width * 0.04, top: height * 0.01, right: width * 0.04),
          child: Column(
            children: [
              Container(
                height: height * 0.2,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Exprience gold(USDT)",
                            style: GoogleFonts.lato(
                                color: Colors.black45, fontSize: 13),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            "30.0",
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            "My accumulated earnings(USDT)",
                            style: GoogleFonts.lato(
                                color: Colors.black45, fontSize: 13),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            "0.03493",
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.356,
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                            width: width * 0.0009, color: Colors.black12),
                      )),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.02, left: width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.02),
                              child: CircleAvatar(
                                radius: height * 0.06,
                                backgroundColor: Colors.green,
                                child: CircleAvatar(
                                  radius: height * 0.053,
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    "5",
                                    style:
                                        GoogleFonts.lato(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              "Remaining\ntimes",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.046,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                      indicatorColor: Colors.teal,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0, color: Colors.teal),
                        insets: EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                      ),
                      tabs: [
                        Text(
                          "Item list",
                          style: GoogleFonts.lato(
                              color: Colors.black45, fontSize: 13),
                        ),
                        Text(
                          "Order log",
                          style: GoogleFonts.lato(
                              color: Colors.black45, fontSize: 13),
                        )
                      ]),
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  Container(
                    height: height * 0.2,
                    width: width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Row(
                          children: [
                            Container(
                              height: height * 0.17,
                              width: width * 0.45,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.02, top: height * 0.01),
                                    child: Text(
                                      "Manual transaction",
                                      style: GoogleFonts.lato(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: width * 0.02,
                                    ),
                                    child: Text(
                                        "Exprience the autometed\ntrnsaction process",
                                        style: GoogleFonts.lato(
                                            color: Colors.black45,
                                            fontSize: 12)),
                                  ),
                                  SizedBox(
                                    height: height * 0.002,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.03,
                                        right: width * 0.03,
                                        top: height * 0.034),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            height: height * 0.07,
                                            width: width * 0.1,
                                            child: Image.asset(
                                              "assets/carton.png",
                                              fit: BoxFit.cover,
                                            )),
                                        const Spacer(),
                                        CircleAvatar(
                                          backgroundColor: Colors.black12,
                                          radius: height * 0.02,
                                          child: Center(
                                              child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              FontAwesomeIcons.arrowRight,
                                              size: 15,
                                              color: Colors.black54,
                                            ),
                                          )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Container(
                              height: height * 0.17,
                              width: width * 0.45,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.02, top: height * 0.01),
                                    child: Text(
                                      "Get count",
                                      style: GoogleFonts.lato(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: width * 0.02,
                                    ),
                                    child: Text("Get more manual\ntransaction",
                                        style: GoogleFonts.lato(
                                            color: Colors.black45,
                                            fontSize: 12)),
                                  ),
                                  SizedBox(
                                    height: height * 0.002,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.03,
                                        right: width * 0.03,
                                        top: height * 0.05),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: Colors.black26,
                                            radius: height * 0.02,
                                            child: CircleAvatar(
                                                radius: height * 0.015,
                                                child: SvgPicture.asset(
                                                  "assets/exchange.svg",
                                                  fit: BoxFit.cover,
                                                ))),
                                        const Spacer(),
                                        CircleAvatar(
                                          backgroundColor: Colors.black12,
                                          radius: height * 0.02,
                                          child: Center(
                                              child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              FontAwesomeIcons.arrowRight,
                                              size: 15,
                                              color: Colors.black54,
                                            ),
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Container(
                          height: height * 0.24,
                          width: width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tips",
                                  style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Text(
                                    "The exprience gold is the transaction founds provided by the\nplatfrom,and cannot be withdrawn;\nEarning from daily trades will be added to the asset after 24\nhours and you can withdrawl it.\nEarning per trade will very bassed on market volatility.\nContact customer service to get more times,buy a robot to\ntrade automatically"
                                    ,style: GoogleFonts.lato(color: Colors.black26,fontSize: 12),
                          )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  TradeWidget()
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
