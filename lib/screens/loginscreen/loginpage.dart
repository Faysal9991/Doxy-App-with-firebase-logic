import 'package:flutter/material.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/new%20code/newnevigation.dart';
import 'package:jadeais/screens/signupscreen/signuppage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier<String> phone = ValueNotifier("");
  ValueNotifier<String> password = ValueNotifier("");
  TextEditingController p = TextEditingController();
  TextEditingController pw = TextEditingController();
  FireBase fireBase = FireBase();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                 child: Container(
                   height: 200,
                   child: Image.asset("assets/login.png",fit: BoxFit.cover,),
                 ),
               ),
              const Text(
                "স্বাগতম Doxi!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),


              /*Container(
                height: height*0.07,

                decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    //labelText: "Phone Number",
                    contentPadding: EdgeInsets.all(20.0),
                    border: InputBorder.none,
                    suffixIcon: IconButton(onPressed: (){},
                          icon: Icon(Icons.remove_red_eye)
                      )
                  ),
                ),
              ),*/
               TextField(
                 keyboardType: TextInputType.visiblePassword,
                 controller: p,
                 decoration: InputDecoration(
                     labelText: "Email or Phone",
                      labelStyle: TextStyle(color: Color(0xffBFB8C9),fontSize: 15),
                     prefixIcon: Icon(Icons.alternate_email,color:Color(0xffBFB8C9),size: 15,)
                 ),
               ),


              TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: pw,
                decoration: InputDecoration(

                    labelText: "Password",
                    labelStyle: TextStyle(color: Color(0xffBFB8C9),fontSize: 15),
                    prefixIcon: Icon(Icons.lock_open,color:Color(0xffBFB8C9),size: 15,),
                   suffix: Text("Forget Password",style: TextStyle(color: Colors.blue),)),
              ),
                SizedBox(height: 40,),
              Center(
                child: SizedBox(
                  height: 40,
                    width: width*.8,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                            backgroundColor: Color(0xffB9E91A),

                        ),
                        onPressed: () async {
                          print(p.text.trim());
                          await fireBase.signIn(p.text.trim(), pw.text.trim());
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NevigationScreen()),
                              (route) => false);
                        },
                        child: const Text("Sign in",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
               ),
              // Row(
              //   children: [
              //     const Text(
              //       "you don't have account",
              //       style: TextStyle(color: Color(0xffA5A3A3)),
              //     ),
              //     const Spacer(),
              //     InkWell(
              //         onTap: () {
              //
              //         },
              //         child: const Text(
              //           "Open an new account",
              //           style: TextStyle(color: Colors.deepOrange),
              //         ))
              //   ],
              // ),
              // Center(
              //   child: SizedBox(
              //       height: 30,
              //       child: ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //               backgroundColor: Colors.orangeAccent),
              //           onPressed: () async {
              //             await fireBase.signIn("guest@gmail.com", "992211");
              //             Navigator.of(context).pushAndRemoveUntil(
              //                 MaterialPageRoute(
              //                     builder: (context) =>
              //                         const NevigationScreen()),
              //                 (route) => false);
              //           },
              //           child: Text("Login as Gest"))),


              //)
        Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You Don,t have a account?",style: TextStyle(color: Colors.black26,fontSize: 16),),
                      Text("Register",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
