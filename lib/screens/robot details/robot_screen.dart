import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/screens/buy_robot_screen.dart';
import 'package:jadeais/widgtes/robot_order.dart';

import '../../mls/botmodel.dart';
import '../../mls/profilemodel.dart';


class RobotDetails extends StatelessWidget {
  RobotDetails({Key? key, required this.myProfile}) : super(key: key);
  Profile myProfile;
  FireBase fireBase = FireBase();

  @override
  Widget build(BuildContext context) {
     final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height*0.08,
                width: width,
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(onPressed: (){

                    },
                     icon: const Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,size: 20,)),
                     SizedBox(width: width*0.1,),
                    const Text("Robot Record Book",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
                  ],
                ),
              ),

              Container(
                height: height,
                width: width,
                color: Colors.transparent,
                child: FutureBuilder<List<Bot>>(
                    future: fireBase.allmyactivebot(),
                    builder: (context, snap) {
                      return snap.hasData?ListView.builder(

                          itemCount: snap.data!.length,

                          itemBuilder: (context, index){
                            Bot bot = snap.data![index];
                            return RobotOrderWidget(height: height, width: width,
                                robotNumber: "$index",
                                offRobot: (){},
                                nlyIncome: "${bot.daily_add}",
                                robotPrice: "${bot.price}",
                                robotDate: "${bot.created}",
                                robotLastDate: "${bot.expired}",
                                todaytimeDate: "${DateTime.now()}",
                                robotBorderNumber: "${bot.id}",
                                onRobot: myProfile.mybots.contains(bot.id)?null:()async{

                                  if(myProfile.totalMoney>=bot.price!){
                                    await fireBase.buyRobot(myProfile, bot);
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Not enough money, recharge")));
                                  }

                                });
                          }
                      ):Center(child: CircularProgressIndicator(),);
                    }
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

