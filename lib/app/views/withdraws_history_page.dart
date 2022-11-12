import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/app/controllers/withdrow_con.dart';

import '../../utils/color_plate.dart';

class WithdrawHistoryPage extends StatelessWidget {
final withdrawCon = Get.put(WithdrawController());
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
      body: Obx(()=> withdrawCon.isLoading.value?Center(
        child: CircularProgressIndicator(),
      ):ListView.builder(
        itemCount: withdrawCon.withdrawinstance.length,
        itemBuilder: (_,index){
          final data = withdrawCon.withdrawinstance[index];
          return Card(
            child: ListTile(
              leading: Icon(data.granted!?Icons.check_circle:Icons.pending),
              title: Text("Amount " + data.amount.toString()+" Tk",style: TextStyle(fontSize: 17),),
              subtitle: Text('Number : ' +data.number.toString()),
            ),
          );
        }
      ))
    );
  }
}
