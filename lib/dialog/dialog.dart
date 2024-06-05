import 'package:circlet/util/color.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


/// 메세지만 있는 확인용 다이얼로그
showConfirmTapDialog(BuildContext context,
    String message,
    VoidCallback onTap){
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.only(top: 40,bottom: 25),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 350,
          child: Text('${message}',
            style: f15bw400,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: [
        Center(
          child: GestureDetector(
            onTap: onTap
            ,
            child: Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: mainColor,
              ),
              child: Center(
                child: Text(
                  '확인',
                  style: f16w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  });
}


/// 확인용 다이얼로그
showOnlyConfirmDialog(BuildContext context, String title, String message){
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.only(top: 40,bottom: 25),
      title: Text('${title}',style: f20bw700,),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 350,
          child: Text('${message}',
            style: f15bw400,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: [
        Center(
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: mainColor,
              ),
              child: Center(
                child: Text(
                  '확인',
                  style: f16w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  });
}

/// 확인과 onTap 다이얼로그
showOnlyConfirmTapDialog(BuildContext context,
    String title,
    String message,
    VoidCallback onTap){
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.only(top: 40,bottom: 25),
      title: Text('${title}',style: f20bw700,),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 350,
          child: Text('${message}',
            style: f15bw400,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: [
        Center(
          child: GestureDetector(
            onTap: onTap
            ,
            child: Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: mainColor,
              ),
              child: Center(
                child: Text(
                  '확인',
                  style: f16w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  });
}