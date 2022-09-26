

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jadeais/screens/signupscreen/tabbar%20view/banijjo_screen.dart';
import 'package:jadeais/screens/signupscreen/tabbar%20view/dol_screen.dart';
import 'package:jadeais/screens/signupscreen/tabbar%20view/home_screen.dart';
import 'package:jadeais/screens/signupscreen/tabbar%20view/trade_screen.dart';
import 'package:jadeais/screens/signupscreen/tabbar%20view/user_screen.dart';

class NavegationBar extends StatefulWidget {
  const NavegationBar({Key? key}) : super(key: key);

  @override
  State<NavegationBar> createState() => _NavegationBarState();
}

int selectedindex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
final screen = [
  const HomePage(),
  const TradeScreen(),
  const BanijjoScreen(),
  const DolScreen(),
  const UserScreen()
];

class _NavegationBarState extends State<NavegationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color(0xffE5E5E5),
        animationCurve: Curves.easeInOutCubicEmphasized,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: screen[selectedindex]);
      }
}
