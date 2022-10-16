import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RobotOrderWidget extends StatelessWidget {
  const RobotOrderWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.robotNumber,
    required this.offRobot,
    required this.nlyIncome,
    required this.robotPrice,
    required this.robotDate,
    required this.robotLastDate,
    required this.todaytimeDate,
    required this.robotBorderNumber,
    required this.onRobot,

  }) : super(key: key);

  final double height;
  final double width;
 final String robotNumber;
 final VoidCallback offRobot;
 final String nlyIncome;
 final String robotPrice;
 final String robotDate;
 final String robotLastDate;
 final String todaytimeDate;
 final String robotBorderNumber;
 final VoidCallback? onRobot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * 0.95,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white10,
                Colors.white,
              ],
            ), borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [

            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Row( mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    robotNumber,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),


                  SvgPicture.asset(
                    "assets/robot.svg",
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "robotEstimatedDai\nlyIncome:\n$nlyIncome",
                        style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                        SizedBox(
              height: height * 0.001,
            ),
                      Text(
                        "Price: $robotPrice",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 203, 196, 196),
                        ),
                      ),  SizedBox(
              height: height * 0.001,
            ),
                      Text(
                        "Starting Date $robotDate",
                        style: const TextStyle(
                          fontSize: 10,
                          color:  Color.fromARGB(255, 203, 196, 196),
                        ),
                      ),
                        SizedBox(
              height: height * 0.001,
            ),
                      Text(
                        "Expired date:-$robotLastDate",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 203, 196, 196),
                        ),
                      )
                    ],
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Text(todaytimeDate,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 10,
                              color:  Color.fromARGB(255, 203, 196, 196),
                            )),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                          ),
                            onPressed: offRobot, child: const Text("Deactive")),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green
                            ),
                            onPressed: onRobot, child: const Text("Working")),
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: height*0.015),
            Container(
              height: height * 0.04,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(6)),
              child: Center(child: Text("Robot order number $robotBorderNumber",style: TextStyle(color: Colors.white),)),
            ),
 SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
