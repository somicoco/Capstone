import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFormBox extends StatelessWidget{
  final String hintText;
  final TextEditingController textController;
  final VoidCallback onTap;
  final ValueChanged onTap2;
  const TextFormBox({Key? key, required this.hintText, required this.textController, required this.onTap, required this.onTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: Color(0xffEBEBEB)
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0xff3648EB))
        ),
        contentPadding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
        hintText: hintText,
        hintStyle: f14w300HintGray,

      ),
      style: TextStyle(
        color: Color(0xff6E6E6E),
      ),
      controller: textController,
      onChanged: onTap2,
    );
  }

}
class IconText extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback ontap;
  const IconText({Key? key, required this.image, required this.text, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
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
                fontSize: 9
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