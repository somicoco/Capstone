import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../util/color.dart';

class TextFormBox extends StatelessWidget{
  final String hintText;
  final TextEditingController textController;
  final VoidCallback onTap;
  final ValueChanged onChange;
  final double? heightSize;
  const TextFormBox({Key? key, required this.hintText, required this.textController, required this.onTap, required this.onChange, this.heightSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            width: 1.5,
              color: Color(0xffEBEBEB)
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0xff3648EB))
        ),
        contentPadding: EdgeInsets.only(top: 15,bottom: 15,left: 13,right: 13),
        hintText: hintText,
        hintStyle: f14w300HintGray,
      ),
      style: TextStyle(
        color: Color(0xff6E6E6E),
      ),
      controller: textController,
      onChanged: onChange,
    );
  }
}
class suffixTextFormBox extends StatelessWidget{
  final String hintText;
  final TextEditingController textController;
  final VoidCallback onTap;
  final ValueChanged onChange;
  final bool isIcon;
  final bool visible;
  final bool isContainer;
  final String? containerText;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final VoidCallback? onpressed;
  const suffixTextFormBox({Key? key, required this.hintText, required this.textController, required this.onTap, required this.onChange, this.isIcon = false, this.isContainer = false, this.textStyle, this.backgroundColor, this.visible=true, this.onpressed, this.containerText })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        obscureText: !visible!,
          decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              width: 1.5,
                color: Color(0xffEBEBEB)
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Color(0xff3648EB))
          ),
          contentPadding: EdgeInsets.only(top: 15,bottom: 15,left: 13,right: 13),
          hintText: hintText,
          hintStyle: f14w300HintGray,
          suffixIcon : isIcon?
          visible?
              IconButton(icon: Icon( Icons.visibility,
                color: blackColor,), onPressed:onpressed)
              :IconButton(icon: Icon(Icons.visibility_off,
            color: blackColor,), onPressed:onpressed):
          isContainer?
              Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12,top: 9,bottom: 9),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(child: Text(containerText!, style: textStyle,)),
                  ),
                ),
              )
              :null
      ),
      style: f14bw300,
      controller: textController,
      onChanged: onChange,
    );
  }
}

class IconText extends StatelessWidget {
  final String image;
  final String text;
  final bool isLarge;
  final VoidCallback ontap;
  final bool check;
  const IconText({Key? key, required this.image, required this.text, required this.ontap, required this.isLarge, this.check = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: isLarge?75:54,
            height: isLarge?75:54,
            decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(8),
                border: check? Border.all(
                    color: mainColor,
                    width: 3
                ):null
            ),
            child: Center(
              child: SizedBox(
                width: isLarge?40:24,
                height: isLarge?40:24,
                child: SvgPicture.asset(
                  '${image}',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text('${text}',
            style: TextStyle(
                fontSize: isLarge?13:9,
            ),)
        ],
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  final String image;
  final VoidCallback ontap;
  const ImageButton({Key? key, required this.image, required this.ontap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          SvgPicture.asset('${image}'),
        ],
      ),
    );
  }
}

Decoration techStackDecoration(String itemName) {
  switch (itemName) {
    case "IOS":
      return BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      );
    case "안드로이드":
      return BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      );
    default:
      return BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      );
  }
}