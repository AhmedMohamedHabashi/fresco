import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresco/feature/account/data/model/user_model.dart';

Future<UserModel> getUserData() async {
  print("USER => ${FirebaseAuth.instance.currentUser}");

  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    throw Exception("User not logged in");
  }

  final doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .get();

  if (!doc.exists || doc.data() == null) {
    throw Exception("User data not found in Firestore");
  }

  return UserModel.fromMap(doc.data()!);
}
