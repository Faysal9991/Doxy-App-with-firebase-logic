import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadeais/screens/signupscreen/tabbar%20view/dol_screen.dart';
import 'package:jadeais/screens/signupscreen/tabbar%20view/home_screen.dart';
import 'package:jadeais/screens/signupscreen/tabbar%20view/trade_screen.dart';
import 'package:jadeais/screens/signupscreen/tabbar%20view/user_screen.dart';
import 'package:jadeais/utils/color_plate.dart';
import 'package:jadeais/widgtes/slider_view.dart';

class NevigationScreen extends StatefulWidget {
  const NevigationScreen({Key? key}) : super(key: key);

  @override
  State<NevigationScreen> createState() => _NevigationScreenState();
}

class _NevigationScreenState extends State<NevigationScreen> {

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
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
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children:[
            HomePage(),
            TradeScreen(),
            DolScreen(),
            UserScreen(),
            SliderView()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
 backgroundColor: Platte.light,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
           inactiveColor: Colors.white60,
              activeColor: Colors.white,
              title: Text('Home'),
              icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
              inactiveColor: Colors.white60,
              activeColor: Colors.white,
              title: Text('Trade',),
              icon: Icon(Icons.add_chart)
          ),
          BottomNavyBarItem(
              inactiveColor: Colors.white60,
              activeColor: Colors.white,
              title: Text('Invite'),
              icon: Icon(Icons.add)
          ),
          BottomNavyBarItem(
              inactiveColor: Colors.white60,
              activeColor: Colors.white,
              title: Text('Item Four'),
              icon: Icon(Icons.person)
          ),
          BottomNavyBarItem(
              inactiveColor: Colors.white60,
              activeColor: Colors.white,
              title: Text('Item Four'),
              icon: Icon(Icons.settings)
          ),
        ],
      ),
    );
  }
}

