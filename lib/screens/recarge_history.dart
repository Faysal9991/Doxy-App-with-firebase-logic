import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/mls/withdrawmodel.dart';
import 'package:jadeais/utils/color_plate.dart';

class Recargehistory extends StatefulWidget {
  const Recargehistory({Key? key}) : super(key: key);

  @override
  State<Recargehistory> createState() => _RecargehistoryState();
}

class _RecargehistoryState extends State<Recargehistory> {
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
        SizedBox(width: 10,),

        SizedBox(width: width*0.1,),
        Center(child: Text("Doxi",style:GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
        const Spacer(),
        IconButton(onPressed: (){},
            icon: Icon(FontAwesomeIcons.bell))
      ],
    ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: StreamBuilder<WithdrawModel>(
      //       stream: fireBase.withdrawHistory(),
      //
      //     builder: (context, snap) {
      //       return ListView.builder(
      //         itemCount: snap.data.,
      //           itemBuilder: (context,index){
      //             return Container(
      //               height: height*0.07,
      //               width: width,
      //               decoration: BoxDecoration(
      //                   color: Platte.background,
      //                 borderRadius: BorderRadius.circular(8)
      //               ),
      //             );
      //           }
      //       );
      //     }
      //   ),
      // ),
    );
  }
}
