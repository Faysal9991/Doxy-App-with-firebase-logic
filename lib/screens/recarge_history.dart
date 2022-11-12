import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/mls/withdrawmodel.dart';
import 'package:jadeais/utils/color_plate.dart';

import '../app/controllers/recharge_con.dart';

class Recargehistory extends StatelessWidget {
  final rechargeCon = Get.put(RechargeController());

  FireBase fireBase = FireBase();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Platte.primary,
        actions: [
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: width * 0.1,
          ),
          Center(
              child: Text(
            "Doxi",
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          )),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.bell))
        ],
      ),
      body: Obx(() => rechargeCon.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: rechargeCon.rechargeinstance.length,
              itemBuilder: (_, index) {
                final data = rechargeCon.rechargeinstance[index];
                return Card(
                  child: ListTile(
                    title: Text("Amount " + data.ammount.toString()+" Tk",style: TextStyle(fontSize: 17),),
                    subtitle: Text('Tranc: ' + data.transactionid.toString()),
                  ),
                );
              },
            )),
    );
  }
}
