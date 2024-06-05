import 'package:circlet/provider/user_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

///이메일 중복 체크
Future<void> registerEmailDuplicate(String email) async {
  final us = Get.put(UserState());
  CollectionReference ref = FirebaseFirestore.instance.collection('user');
  QuerySnapshot snapshot = await ref.where('email', isEqualTo: email).get();
  final allData = snapshot.docs.map((doc) => doc.data()).toList();
  us.memberCheckEmail.value = allData.isEmpty?'0':'1';
  us.memberCheckEmail.value == '0'? us.registerEmail.value = email: '';
}

///핸드폰 번호 중복 체크
Future<void> registerPhoneDuplicate(String phone) async {
  final us = Get.put(UserState());
  CollectionReference ref = FirebaseFirestore.instance.collection('user');
  QuerySnapshot snapshot = await ref.where('phone', isEqualTo: phone).get();
  final allData = snapshot.docs.map((doc) => doc.data()).toList();
  us.memberCheckPhone.value = allData.isEmpty?'0':'1';
}

///닉네임 중복 체크
Future<void> registerNicknameDuplicate(String nickname) async {
  final us = Get.put(UserState());
  CollectionReference ref = FirebaseFirestore.instance.collection('user');
  QuerySnapshot snapshot = await ref.where('nickname', isEqualTo: nickname).get();
  final allData = snapshot.docs.map((doc) => doc.data()).toList();
  us.memberCheckNickname.value = allData.isEmpty?'0':'1';
  us.memberCheckNickname.value == '0'? us.registerNickname.value = nickname: '';
}

///로그인
Future<void> Login(String email, String pw) async {
  final us = Get.put(UserState());
  CollectionReference ref = FirebaseFirestore.instance.collection('user');
  try{
    QuerySnapshot snapshot2 = await ref.where('email', isEqualTo: email).get();
    final allData = snapshot2.docs.map((doc) => doc.data()).toList();
    List a = allData;
    if(a[0]['password']==pw){
      us.userList.value = a;
    }else{
      us.userList.clear();
    }
  } catch(e) {}
  }