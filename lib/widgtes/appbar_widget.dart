

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.07,
      width: width,
      color: Colors.white24,
      child: Padding(
        padding: EdgeInsets.only(left: width*0.03,right: width*0.02),
        child: Row(
          children: [
            CircleAvatar(
             radius: 14,
             backgroundColor: const Color.fromARGB(255, 91, 95, 97),
             child:  Padding(
               padding: const EdgeInsets.all(8.0),
               child: SvgPicture.asset("assets/user-solid.svg",color: Colors.white,),
             )),
         const Spacer(),
        IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.bell))
          ],
        ),
      ),
    );
  }
}
