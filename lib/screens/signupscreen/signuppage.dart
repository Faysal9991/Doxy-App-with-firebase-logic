import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jadeais/helper/authhelper.dart';
import 'package:jadeais/new%20code/newnevigation.dart';
import 'package:jadeais/screens/loginscreen/loginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ValueNotifier<String> phone = ValueNotifier("");
  ValueNotifier<String> password = ValueNotifier("");

  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController rafer = TextEditingController();
  FireBase fireBase = FireBase();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.18,
                ),
                const Text(
                  "স্বাগতম Doxi!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                const Text(
                  "Input your gmail adress",
                  style: TextStyle(color: Color(0xffA5A3A3)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: email,
                    decoration: InputDecoration(
                      //labelText: "পাসওয়ার্ড লিখুন",
                      hintText: "enter gmail",

                      contentPadding: EdgeInsets.only(
                          left: width * 0.03, bottom: height * 0.01),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                  "Enter User name",
                  style: TextStyle(color: Color(0xffA5A3A3)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: userName,
                    decoration: InputDecoration(
                      hintText: "Username",
                      //labelText: "পাসওয়ার্ড লিখুন",
                      contentPadding: EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                  "Enter password",
                  style: TextStyle(color: Color(0xffA5A3A3)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: userPassword,
                    decoration: InputDecoration(
                      hintText: "Repeat password",
                      //labelText: "পাসওয়ার্ড লিখুন",
                      contentPadding: EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                  "Enter refer code",
                  style: TextStyle(color: Color(0xffA5A3A3)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: rafer,
                    decoration: InputDecoration(
                      hintText: "Enter refer code",
                      contentPadding: EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                    width: width,
                    child: ElevatedButton(
                        onPressed: () async {
                          await fireBase.signUp(email.text.trim(),
                              userPassword.text.trim(), userName.text.trim());
                          updateUserWallet(rafer.text);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => NevigationScreen()),
                              (route) => false);
                        },
                        child: const Text("Sign up"))),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    const Text(
                      "Do you have account?",
                      style: TextStyle(color: Color(0xffA5A3A3)),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text(
                          "sign in",
                          style: TextStyle(color: Colors.teal),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateUserWallet(String text) {
    final docRef = firebaseFirestore.collection("profile").doc(text);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        final oldWallet = data['totalMoney'];
        final newValue = oldWallet + 10;
        firebaseFirestore.collection("profile").doc(text).set({
          "email":data['email'],
          "mybots":data['mybots'],
          "profileImage":data['profileImage'],
          "totalMoney": newValue,
          "uid":data['uid'],
          "username":data['username']
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
