// import 'package:circlet/screen/profile/edit/edit_interest_page.dart';
// import 'package:circlet/util/color.dart';
// //import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../components/components.dart';
// import '../../../provider/user_state.dart';
// import '../../../util/font/font.dart';
//
// class ProfileEditPage extends StatefulWidget {
//   const ProfileEditPage({super.key});
//
//   @override
//   State<ProfileEditPage> createState() => _ProfileEditPageState();
// }
//
// class _ProfileEditPageState extends State<ProfileEditPage> {
//   bool _isLoading = true;
//
//   TextEditingController nickNameController = TextEditingController();
//   TextEditingController messageController = TextEditingController();
//   TextEditingController techStackController = TextEditingController();
//   String validateNicknameText = ''; ///닉네임 유효성 검사 Text
//   bool isNicknameValid = false;///닉네임 유효성 검사 여부
//   ///
//   String docId = '9yDljvHIPw7YE79UhV1p';
//   List itemList = ['IOS', '안드로이드', '프론트엔드'];
//   List techList = ['Flutter'];
//
//   @override
//   void initState(){
//     super.initState();
//     final us = Get.put(UserState());
//     getUserDetail().then((_) {
//       nickNameController.text = us.userList[0]['userName'];
//       messageController.text = us.userList[0]['introduce'];
//       setState(() {
//         _isLoading = false;
//       });
//     });
//
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: (){
//       FocusScope.of(context).unfocus();
//     },
//     child: Scaffold(
//       appBar: AppBar(
//         title: Text('프로필 수정',
//           style: f22bw500,),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(1), // Divider의 높이 설정
//           child: Divider(
//             color: Color(0xffEBEBEB), // Divider의 색상 설정
//             height: 1, // Divider의 높이 설정
//             thickness: 1, // Divider의 두께 설정
//           ),
//         ),
//       ),
//       body: _isLoading
//           ?Center(
//         child: CircularProgressIndicator(),
//       )
//           :Padding(
//         padding: EdgeInsets.only(top:12,left: 12,right: 12),
//         child: SingleChildScrollView(
//           physics: const ClampingScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 115,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle, // 원형 모양으로 설정
//                         border: Border.all(
//                           color: Colors.black, // 테두리 색상 설정
//                           width: 1, // 테두리 두께 설정
//                         ),
//                       ),
//                       child: CircleAvatar(
//                         radius: 55, // 반지름 설정
//                         backgroundImage: AssetImage('assets/image/testImage.png'), // 이미지 설정
//                       ),
//                     ),
//                     Positioned(
//                       top: 80,
//                       right: 0,
//                       child: GestureDetector(
//                         onTap: () {
//                           print('111');
//                           setState(() {
//                           });
//
//                         },
//                         child: Container(
//                           width: 23,
//                           height: 23,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: grayColor
//                           ),
//                           child: Icon(Icons.edit, color: Colors.black,size: 20,),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 23,
//               ),
//               Text('닉네임', style: f15bw500),
//               const SizedBox(
//                 height: 10,
//               ),
//               suffixTextFormBox(
//                 hintText: '닉네임을 입력해주세요',
//                 textController: nickNameController,
//                 onTap: (){
//                   print('111');
//                   getUserDetail();
//                   //readData(docId);
//                   //getUserData();
//                   print(isNicknameValid);},
//                 onChange: (v){
//                   isNicknameValid = validateNickname(v);
//                   setState(() {
//                     validateNicknameText = isNicknameValid?'':'닉네임은 2자이상 8자이하의 형식으로 입력해주세요.';
//
//                   });
//                 },
//                 isContainer: true,
//                 containerText: '중복체크',
//                 textStyle: f14w300,
//                 backgroundColor: mainColor,
//               ),
//               Text(validateNicknameText, style: TextStyle(fontSize: 12,color: isNicknameValid?Color(0xff0DD675):Color(0xffABABAB)),),
//               const SizedBox(
//                 height: 17,
//               ),
//               Text('프로필 메세지', style: f15bw500),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormBox(
//                   hintText: '나를 설명하고 싶은 메세지를 작성해주세요.',
//                   textController: messageController,
//                   onTap: (){},
//                   onChange: (v){},),
//               const SizedBox(
//                 height: 23,
//               ),
//               Row(
//                 children: [
//                   Text('관심분야', style: f16bw500,),
//                   SizedBox(
//                     width: 12,
//                   ),
//                   GestureDetector(
//                       onTap: (){
//                         Get.to(() => EditInterestPage(itemList: itemList));
//                         setState(() {
//
//                         });
//
//                       },
//                       child: Icon(Icons.add_circle_outlined, color: blackColor,size: 18,))
//                 ],
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               Wrap(
//                 direction: Axis.horizontal,
//                 alignment: WrapAlignment.start,
//                 spacing: 5, // 좌우 간격
//                 runSpacing: 5, // 상하 간격
//                 children: itemList.map((item) {
//                   return Container(
//                     height: 28,
//                     padding: EdgeInsets.only(top:5,left: 10, right: 10),
//                     decoration: BoxDecoration(
//                       color: interestBackgroundColor[item],
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Text(
//                       item,
//                       style: TextStyle(
//                           fontFamily:'NotoSans',
//                           fontSize:12,
//                           fontWeight:FontWeight.w700,
//                           color: interestTextColor[item]),
//                     ),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(
//                 height: 44,
//               ),
//               Text('관심분야', style: f16bw500,),
//               const SizedBox(
//                 height: 7,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: Get.width*0.75,
//                     height: 45,
//                     child: TextFormBox(
//                         hintText: 'ex) Javascript',
//                         textController: techStackController,
//                         onTap: (){},
//                         onChange: (v){}),
//                   ),
//                   Spacer(),
//                   GestureDetector(
//                     onTap: (){
//                       techList.add(techStackController.text);
//                       techStackController.clear();
//                       print(techList);
//                       setState(() {
//
//                       });
//                     },
//                     child: Container(
//                       width: Get.width*0.17,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: darkGrayColor,
//                       ),
//                       child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
//                         child: Text(
//                           '등록',
//                           style: f16w500,
//                         ),
//                       ),
//                     ),
//                   )
//
//                 ],
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Wrap(
//                 direction: Axis.horizontal,
//                 alignment: WrapAlignment.start,
//                 spacing: 5, // 좌우 간격
//                 runSpacing: 5, // 상하 간격
//                 children: techList.asMap().entries.map((entry) {
//                   final int index = entry.key;
//                   final String tech = entry.value;
//                   return Stack(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.only(left: 7,right: 30,top: 10, bottom: 10),
//                         decoration: BoxDecoration(
//                           color: darkGrayColor,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(
//                           tech,
//                           style: f16w300,
//                         ),
//                       ),
//                       Positioned(
//                         top: 12,
//                         right: 6,
//                         child: GestureDetector(
//                           onTap: () {
//                             // 해당 요소를 리스트에서 삭제
//                             setState(() {
//                               techList.removeAt(index);
//                             });
//
//                           },
//                           child: Container(
//                             child: Icon(Icons.close, color: Colors.white,size: 20,),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               GestureDetector(
//                 onTap: (){
//                   setState(() {
//
//                   });
//
//                 },
//                 child: Container(
//                   height: 60,
//                   decoration: BoxDecoration(
//                       color: Color(0xff3648EB),
//                       borderRadius: BorderRadius.circular(5)
//                   ),
//                   child: Center( // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
//                     child: Text(
//                       '변경하기',
//                       style: TextStyle(
//                           color: Color(0xffFFFFFF)
//                           ,fontSize: 18),
//                     ),
//                   ),
//                 ),
//               )
//
//
//
//
//
//             ],
//           ),
//         ),
//       ),
//
//
//     ),
//     );
//   }
// }
// ///닉네임 유효성 검사 2자리 이상 8자리 이하
// bool validateNickname(String nickname) {
//   int minLength = 2;
//   int maxLength = 8;
//
//   return nickname.length >= minLength && nickname.length <= maxLength;
// }
//
// void addUserData() async {
//   CollectionReference ref = FirebaseFirestore.instance.collection('user');
//
//   await ref.add({
//     'email': 'id',
//     'docId': '',
//     'createDate':'${DateTime.now()}'
//   }).then((doc) {
//     // print('doc ?? ${doc.id}'); /// 고유키
//     ref.doc(doc.id).update({'docId': doc.id});
//   });
// }
// Future<void> getUserDetail() async{
//   String docId = '9yDljvHIPw7YE79UhV1p';
//   final us = Get.put(UserState());
//   CollectionReference ref = FirebaseFirestore.instance.collection('user');
//   try {
//     QuerySnapshot snapshot2 = await ref.where('userId', isEqualTo: docId).get();
//     //await ref.where('userId', isEqualTo: '${us.userList[0]['userId']}').get();
//     final allData = snapshot2.docs.map((doc) => doc.data()).toList();
//     List a = allData;
//     us.userList.value = a;
//     print(a);
//     print(us.userList);
//     print(us.userList[0]['techStack']);
//   } catch (e) {}
// }
// void readData(String userId) async {
//   try {
//     // CollectionReference 가져오기
//     CollectionReference ref = FirebaseFirestore.instance.collection('user');
//
//     // docId를 사용하여 해당 문서 가져오기
//     DocumentSnapshot snapshot = await ref.doc(userId).get();
//
//     if (snapshot.exists) {
//       // 문서가 존재하는 경우 데이터 출력
//       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//       print(data);
//       print('interest: ${data['interest']}');
//       print('techStack:${data['techStack']}');
//       print('introduce:${data['introduce']}');
//       print('createDate: ${data['createDate']}');
//       print('userId: ${snapshot.id}');
//     } else {
//       // 문서가 존재하지 않는 경우
//       print('해당 문서가 존재하지 않습니다.');
//     }
//   } catch (e) {
//     // 에러 발생 시 처리
//     print('데이터를 읽어오는 중 오류가 발생했습니다: $e');
//   }
// }