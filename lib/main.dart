import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jadeais/new%20code/newnevigation.dart';
import 'package:jadeais/screens/loginscreen/loginpage.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
          stream: auth.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.active){
              if(snapshot.hasData){
                return NevigationScreen();
              }
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return Scaffold(body: Center(child: CircularProgressIndicator(),),);
            }
            return LoginPage();
          }
      ),
      builder: EasyLoading.init(),
    );
  }
}

