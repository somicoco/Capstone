import 'package:circlet/util/font/font.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../util/color.dart';

class TextFormBox extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final VoidCallback onTap;
  final ValueChanged onChange;
  final String? multiline;
  final TextInputType? keyboardType;

  const TextFormBox(
      {Key? key,
      required this.hintText,
      required this.textController,
      required this.onTap,
      required this.onChange,
      this.multiline,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: multiline == 'true' ? null : 1,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 1.5, color: Color(0xffEBEBEB)),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0xff3648EB))),
        contentPadding:
            EdgeInsets.only(top: 15, bottom: 15, left: 13, right: 13),
        hintText: hintText,
        hintStyle: f14w300HintGray,
      ),
      style: TextStyle(
        color: Color(0xff6E6E6E),
      ),
      controller: textController,
      onChanged: onChange,
      keyboardType: keyboardType ?? TextInputType.text,
    );
  }
}

class suffixTextFormBox extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final VoidCallback onTap;
  final ValueChanged onChange;
  final String? suffixText;
  final bool isText;
  final bool isIcon;
  final bool visible;
  final bool isContainer;
  final String? containerText;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final VoidCallback? onpressed;
  final TextInputType? keyboardType;

  const suffixTextFormBox(
      {Key? key,
      required this.hintText,
      required this.textController,
      required this.onTap,
      required this.onChange,
      this.isText = false,
      this.isIcon = false,
      this.isContainer = false,
      this.textStyle,
      this.backgroundColor,
      this.visible = true,
      this.onpressed,
      this.containerText,
      this.keyboardType,
      this.suffixText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !visible!,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 1.5, color: Color(0xffEBEBEB)),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Color(0xff3648EB))),
        contentPadding:
            EdgeInsets.only(top: 15, bottom: 15, left: 13, right: 13),
        hintText: hintText,
        hintStyle: f14w300HintGray,
        suffixIcon: suffixText != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  suffixText!,
                  style: f14rw500
                ),
              )
            : isIcon
                ? visible
                    ? IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: onpressed)
                    : IconButton(
                        icon: Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: onpressed)
                : isContainer
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 9, bottom: 9),
                        child: GestureDetector(
                          onTap: onTap,
                          child: Container(
                            width: 70,
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              containerText!,
                              style: textStyle,
                            )),
                          ),
                        ),
                      )
                    : null,
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

  const IconText(
      {Key? key,
      required this.image,
      required this.text,
      required this.ontap,
      required this.isLarge,
      this.check = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: isLarge ? 75 : 54,
            height: isLarge ? 75 : 54,
            decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(8),
                border: check ? Border.all(color: mainColor, width: 3) : null),
            child: Center(
              child: SizedBox(
                width: isLarge ? 40 : 24,
                height: isLarge ? 40 : 24,
                child: SvgPicture.asset(
                  '${image}',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            '${text}',
            style: TextStyle(
              fontSize: isLarge ? 13 : 9,
            ),
          )
        ],
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  final String image;
  final VoidCallback ontap;
  final double? iconSize;

  const ImageButton({
    Key? key,
    required this.image,
    required this.ontap,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          iconSize == null
              ? SvgPicture.asset('${image}')
              : SizedBox(
                  height: iconSize,
                  width: iconSize,
                  child: SvgPicture.asset('${image}'),
                ),
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

class ButtonStyle1 extends StatelessWidget {
  final String text;
  final VoidCallback ontap;

  const ButtonStyle1({
    Key? key,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xff3648EB),
          //borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
          child: Text(
            text,
            style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class ButtonStyle2 extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final String value;

  const ButtonStyle2({
    Key? key,
    required this.text,
    required this.ontap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: value == text ? mainColor : grayColor2,
              width: 1,
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Center(
            // 텍스트를 가운데에 위치시키기 위해 Center 위젯 추가
            child: Text(
              text,
              style: value == text ? f14mw400 : f14g2w400,
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownService extends StatelessWidget {
  final double width;
  final List<String> item;
  final ValueChanged onChange;
  final String? selectedValue;

  const DropDownService({
    Key? key,
    required this.width,
    required this.item,
    required this.onChange,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: grayColor)),
      child: Padding(
        padding: EdgeInsets.only(top: 2, right: 5, bottom: 2),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            iconStyleData: IconStyleData(
                icon: SvgPicture.asset('assets/icon/dropdown.svg'),
                iconSize: 15),
            value: selectedValue,
            items: item.map((String item) {
              return DropdownMenuItem<String>(
                child: Text(
                  item,
                  style: f14bw400,
                ),
                value: item,
              );
            }).toList(),
            onChanged: onChange,
          ),
        ),
      ),
    );
  }
}

/// 앱바 컴포넌트
class StyledAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  StyledAppBar({required this.text});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: BackButton(color: blackColor,),
      title: Text(
        text,
        style: f20bw500,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1), // Divider의 높이 설정
        child: Divider(
          color: Color(0xffEBEBEB), // Divider의 색상 설정
          height: 1, // Divider의 높이 설정
          thickness: 1, // Divider의 두께 설정
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
