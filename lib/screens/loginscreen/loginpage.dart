import 'package:flutter/material.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/screens/signupscreen/signuppage.dart';

import '../../widgtes/phonenumberpicker.dart';
import '../signupscreen/tabbar view/nevegation_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier<String> phone = ValueNotifier("");
  ValueNotifier<String> password = ValueNotifier("");
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
                const Text("স্বাগতম Jade Ai!",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: height*0.06,),
                const Text("আপনার ফোন নম্বার",style: const TextStyle(color: Color(0xffA5A3A3)),),
                SizedBox(height: height*0.02,),
                SizedBox(
                    height: height*0.07,
                    child: PhoneNumberPicker(phone: phone,)),
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

                SizedBox(height: height*0.02,),
                const Text("পাসওয়ার্ড লিখুন",style: TextStyle(color: Color(0xffA5A3A3)),),
                SizedBox(height: height*0.02,),
                Container(
                  height: height*0.07,

                  decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (s){
                      password.value=s;
                    },
                    //controller: password,
                    decoration: InputDecoration(
                        //labelText: "পাসওয়ার্ড লিখুন",

                        contentPadding: EdgeInsets.all(20.0),
                        border: InputBorder.none,
                        suffixIcon: IconButton(onPressed: (){},
                            icon: Icon(Icons.remove_red_eye)
                        )
                    ),
                  ),
                ),
                SizedBox(height: height*0.02,),
                const Text("পাসওয়ার্ড ভুলে গেছেন?",style: TextStyle(color: Color(0xffA5A3A3)),),
                SizedBox(height: height*0.02,),
                SizedBox(
                    width: width,
                    child: ElevatedButton(onPressed: ()async{
                      await fireBase.signIn(phone.value+"@gamil.com", password.value);
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>NavegationBar()), (route) => false);
                    }, child: const Text("প্রবেশ করুন"))),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    const Text("কোন একাউন্ট নেই?",style: TextStyle(color: Color(0xffA5A3A3)),),
                    const Spacer(),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpPage()));
                        },
                        child: const Text("এখান থেকে একাউন্ট  খুলুন।",style: TextStyle(color: Colors.teal),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
