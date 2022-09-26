import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.svgname,
    required this.iconName,
    required this.gotoScreenName
  }) : super(key: key);
   final double height;
  final double width;
 final String svgname;
  final String iconName;
  final VoidCallback gotoScreenName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: gotoScreenName,
      child: Column(
        children: [
          SizedBox(
            height: height*0.05,
            width: width*0.12,
            child: SvgPicture.asset(svgname,color: Colors.green,fit: BoxFit.cover,)),
          Text(
            iconName,
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
