import 'package:flutter/material.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/new%20code/newnevigation.dart';
import 'package:jadeais/screens/signupscreen/signuppage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @overridq
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;



    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.18,),
                const Text("স্বাগতম Doxi!",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: height*0.06,),
                const Text("Please enter your Gmail",style: const TextStyle(color: Color(0xffA5A3A3)),),
                SizedBox(height: height*0.02,),
               
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
                 Container(
                  height: height*0.05,

                  decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,

                    controller: p,
                    decoration:  InputDecoration(
                        //labelText: "পাসওয়ার্ড লিখুন",
                        hintText: "enter gmail",

                        contentPadding: EdgeInsets.only(left: width*0.03,bottom: height*0.01),
                        border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: height*0.02,),
                const Text("Entre password",style: TextStyle(color: Color(0xffA5A3A3)),),
                SizedBox(height: height*0.02,),
                Container(
                  height: height*0.05,

                  decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,

                    controller: pw,
                    decoration: InputDecoration(
                        //labelText: "পাসওয়ার্ড লিখুন",

                        contentPadding: const EdgeInsets.all(20.0),
                        border: InputBorder.none,
                        suffixIcon: IconButton(onPressed: (){},
                            icon: const Icon(Icons.remove_red_eye)
                        )
                    ),
                  ),
                ),
                SizedBox(height: height*0.02,),
                const Text("Forget passowrd?",style: TextStyle(color: Color(0xffA5A3A3)),),
                SizedBox(height: height*0.02,),
                SizedBox(
                    width: width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange
                      ),
                        onPressed: ()async{
                      print(p.text.trim());
                      await fireBase.signIn(p.text.trim(), pw.text.trim());
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const NevigationScreen()), (route) => false);
                    }, child: const Text("Sign in"))),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    const Text("you don't have account",style: TextStyle(color: Color(0xffA5A3A3)),),
                    const Spacer(),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const SignUpPage()));
                        },
                        child: const Text("Open an new account",style: TextStyle(color: Colors.deepOrange),))
                  ],
                ),
                Center(
                  child: SizedBox(
                    height: 30,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent
                          ),
                          onPressed: ()async{
                            await fireBase.signIn("guest@gmail.com","992211");
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const NevigationScreen()), (route) => false);
                          }, child: Text("Login as Gest"))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
