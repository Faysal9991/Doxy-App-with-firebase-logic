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
    return DefaultTabController(
      length: 4,
      child: SafeArea(
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
                      IconButton(onPressed: (){},
                       icon: const Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,size: 20,)),
                       SizedBox(width: width*0.1,),
                      const Text("রোবট রেকর্ডস",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
                    ],
                  ),
                ),
             
              Container(
                height: height*0.06,
                width: width,
                color: Colors.white,
                child: const TabBar(tabs:[
                Text("সব রোবট",style: TextStyle(color: Colors.black),),
                Text("নিষ্ক্রিয়",style: TextStyle(color: Colors.black),),
                Text("কাজ করছি",style: TextStyle(color: Colors.black),),
                Text("বন্ধ",style: TextStyle(color: Colors.black),),
                
             ] ),
              ),
              SizedBox(height: height*0.01,),
              Container(
                 height: height*0.9,
                  width: width,
                  color: Colors.transparent,
                child: TabBarView(
                  children: [
                SizedBox(
                  height: height,
                  width: width,
                  
                 child: StreamBuilder<List<Bot>>(
                   stream: fireBase.allthebots(),
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
                 )/*SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: 20,
                            itemBuilder: (context, index){
                              return Text("chehc");
                            }
                        )
                       *//*RobotOrderWidget(height: height, width: width,
                       robotNumber: "No 0.1",
                        offRobot: (){}, 
                        nlyIncome: "0.04~0,6U ", 
                        robotPrice: "2.0U",
                         robotDate: "30U",
                          robotLastDate: "19245",
                           todaytimeDate: "2022-09-03 21:55:13",
                            robotBorderNumber: "DD383838g3782888738",
                             onRobot: (){}),
                             SizedBox(height: height*0.01,),
                              RobotOrderWidget(height: height, width: width, 
                       robotNumber: "No 0.1",
                        offRobot: (){}, 
                        nlyIncome: "0.04~0,6U ", 
                        robotPrice: "2.0U",
                         robotDate: "30U",
                          robotLastDate: "19245",
                           todaytimeDate: "2022-09-03 21:55:13",
                            robotBorderNumber: "DD383838g3782888738",
                             onRobot: (){}),
                             SizedBox(height: height*0.01,),
                              RobotOrderWidget(height: height, width: width, 
                       robotNumber: "No 0.1",
                        offRobot: (){}, 
                        nlyIncome: "0.04~0,6U ", 
                        robotPrice: "2.0U",
                         robotDate: "30U",
                          robotLastDate: "19245",
                           todaytimeDate: "2022-09-03 21:55:13",
                            robotBorderNumber: "DD383838g3782888738",
                             onRobot: (){}),
                             SizedBox(height: height*0.1,),*//*
                      ],
                    ),
                  ),*/
                 ),
                 Container(
                  height: height,
                  width: width,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        height: height*0.4,
                        width: width*0.95,
                        color: Colors.amber,
                      ),
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
                 Container(
                  height: height,
                  width: width,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        height: height*0.4,
                        width: width*0.95,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                 )




                ]),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

