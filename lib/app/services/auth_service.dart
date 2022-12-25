import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String> inputData() async {
    final User user = await FirebaseAuth.instance.currentUser!;
    final String uid = user.uid.toString();
    return uid;
  }
}
