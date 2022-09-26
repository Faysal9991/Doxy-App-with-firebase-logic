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
    return Container(
      height: height * 0.4,
      width: width * 0.95,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.03, right: width * 0.03, top: height * 0.02),
            child: Row(
              children: [
                Text(
                  robotNumber,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                InkWell(
                  onTap: offRobot,
                  child: const Text(
                    "নিষ্ক্রিয়",
                    style: TextStyle(fontSize: 16, color: Colors.teal),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: Row(
              children: [
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
                      "দাম: $robotPrice",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 203, 196, 196),
                      ),
                    ),  SizedBox(
            height: height * 0.001,
          ),
                    Text(
                      "আমানত শুরুঃ $robotDate",
                      style: const TextStyle(
                        fontSize: 10,
                        color:  Color.fromARGB(255, 203, 196, 196),
                      ),
                    ),
                      SizedBox(
            height: height * 0.001,
          ),
                    Text(
                      "বাকি দিনের সংখ্যা:-$robotLastDate আকাশ",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 203, 196, 196),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Text(todaytimeDate,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        color:  Color.fromARGB(255, 203, 196, 196),
                      )),
                )
              ],
            ),
          ),
          SizedBox(height: height*0.015),
          Container(
            height: height * 0.04,
            width: width * 0.9,
            decoration: BoxDecoration(
                color: const Color(0xffE5E5E5),
                borderRadius: BorderRadius.circular(6)),
            child: Center(child: Text("রোবট অর্ডার নম্বরঃ $robotBorderNumber")),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.6),
            child: ElevatedButton(onPressed: onRobot, child: const Text("সক্রিয়করণ")),
          )
        ],
      ),
    );
  }
}
