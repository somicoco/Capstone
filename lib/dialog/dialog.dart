import 'package:flutter/material.dart';

showOnlyConfirmTapDialog(BuildContext context,
    String title,
    VoidCallback onTap){
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.only(top: 35,bottom: 35),
      content: Container(
        width: 200,
        child: Text('${title}',
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Divider(
          height: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor:
                  MaterialStateProperty.all(Colors.teal),
                ),
                child: Text("확인", ),
                onPressed: onTap,
              ),
            ),
          ],
        )
      ],
    );
  });
}