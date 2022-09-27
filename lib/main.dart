import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jadeais/screens/loginscreen/loginpage.dart';


import 'firebase_options.dart';
import 'screens/signupscreen/tabbar view/nevegation_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

  // ignore: must_be_immutable
  class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      theme: ThemeData(
    primarySwatch: Colors.deepOrange,
    iconTheme: IconThemeData(color: Colors.black),),
      //home: const NavegationBar(),
      home: StreamBuilder(
          stream: auth.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.active){
              if(snapshot.hasData){
                return const NavegationBar();
              }
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
            }
            return LoginPage();
          }
      ),
    );
  }
}

