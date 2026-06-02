import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/feature/account/data/model/user_model.dart';
import 'package:fresco/feature/account/presentation/cubit/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> getUser() async {
    emit(AccountLoading());

    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) {
        emit(AccountError("User not logged in"));
        return;
      }

      final doc = await _firestore.collection('users').doc(uid).get();

      if (!doc.exists) {
        emit(AccountError("User not found"));
        return;
      }

      emit(AccountLoaded(UserModel.fromMap(doc.data()!)));
    } catch (e) {
      emit(AccountError(e.toString()));
    }
  }

  Future<void> updateUser({
    required String name,
    required String phone,
    required String address,
  }) async {
    if (state is! AccountLoaded) return;

    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _firestore.collection('users').doc(uid).update({
      'name': name,
      'phone': phone,
      'address': address,
    });

    // reload data بعد التحديث (الأصح)
    await getUser();
  }
}
