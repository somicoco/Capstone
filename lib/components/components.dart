import 'dart:io';
import 'package:circlet/screen/post/post_view_page.dart';
import 'package:circlet/screen/profile/user/user_profile_page.dart';
import 'package:circlet/util/font/font.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

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
  final bool enabled;

  const suffixTextFormBox(
      {Key? key,
      required this.hintText,
      required this.textController,
      required this.onTap,
      required this.onChange,
      this.enabled = true,
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
      enabled: enabled,
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
                child: Text(suffixText!, style: f14rw500),
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
              fontFamily: 'NotoSans',
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

class StudyInfo {
  String studyName;
  String studyCategory;
  String studyLocation;
  String studyIntro;
  List<String> tags;
  int members;
  int views;

  StudyInfo(this.studyName, this.studyCategory, this.studyLocation,
      this.studyIntro, this.tags, this.members, this.views);
}

class Message {
  final String text;
  final String userId;
  final bool isUserMessage;

  Message(this.text, this.isUserMessage, this.userId);
}

class PostInfo {
  String id;
  String title;
  String content;
  String date;
  String category;
  int likeCount;
  int commentCount;
  int viewCount;
  bool like;
  List<String> imagePaths;

  PostInfo({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.category,
    this.likeCount = 0,
    this.commentCount = 0,
    this.viewCount = 0,
    this.like = false,
    required this.imagePaths,
  }) ;
}

class PostItem extends StatelessWidget {
  final PostInfo postInfo;
  final VoidCallback onHeartTap;

  const PostItem({Key? key, required this.postInfo, required this.onHeartTap})
      : super(key: key);




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PostViewPage(postInfo: postInfo));
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 26, bottom: 10),
            child: Row(
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      ClipOval(
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                            'assets/image/example/profile_pic.png',
                            fit: BoxFit.cover,
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '둘리',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NotoSans',
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.to(UserProfilePage());
                  },
                ),
                Spacer(),
                Text(
                  postInfo.date as String,
                  style: TextStyle(
                      fontSize: 8,
                      color: Color(0xffABABAB),
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 1), // 너무 가까워보임
                Text('조회수 ${postInfo.viewCount}',
                    style: TextStyle(
                        fontSize: 8,
                        color: Color(0xffABABAB),
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 32),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        postInfo.title,
                        maxLines: null,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'NotoSans'),
                      ),
                      width: MediaQuery.of(context).size.width / 1.5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Text(
                        postInfo.content,
                        maxLines: null,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'NotoSans'),
                      ),
                    ),
                    const SizedBox(height: 4),
                    postInfo.imagePaths.length > 0
                        ? Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width -
                                    28, // 여기 부분 수정해야함
                                height: 220,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image.network(
                                  postInfo.imagePaths[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              postInfo.imagePaths.length > 1
                                  ? Positioned(
                                      top: 7,
                                      right: 7,
                                      child: Container(
                                          width: 29,
                                          height: 26,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0xff7E889C)),
                                          child: Center(
                                            child: Text(
                                                '${postInfo.imagePaths.length}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontFamily: 'NotoSans',
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          )),
                                    )
                                  : SizedBox()
                            ],
                          )
                        : SizedBox()
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 23,
          ),
          _ThinBottomLine(),
          Padding(
            padding: EdgeInsets.only(left: 21, top: 11, bottom: 16),
            // 위 아래 12하면 가운데
            child: Row(
              children: [
                GestureDetector(
                  onTap: onHeartTap,
                  child: SvgPicture.asset(postInfo.like
                      ? 'assets/icon/Heart.svg'
                      : 'assets/icon/emptyHeart.svg'),
                ),
                const SizedBox(width: 5),
                Text('${postInfo.likeCount}',
                    style: TextStyle(
                        fontFamily: 'Bold',
                        fontSize: 12,
                        fontWeight: FontWeight.w700)),
                const SizedBox(width: 6),
                SvgPicture.asset('assets/icon/chat.svg'),
                const SizedBox(width: 5),
                Text('${postInfo.commentCount}',
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w700)),
                Spacer(),
                Text(postInfo.category,
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w500,
                        color: Color(0xffABABAB))),
                const SizedBox(width: 29),
              ],
            ),
          ),
          _ThickBottomLine()
        ],
      ),
    );
  }

  Widget _ThinBottomLine() {
    return Container(
      color: Color(0xffEBEBEB),
      height: 1,
      width: double.infinity,
    );
  }

  Widget _ThickBottomLine() {
    return Container(
      color: Color(0xffEBEBEB),
      height: 10,
      width: double.infinity,
    );
  }
}

class noticeItem extends StatelessWidget {
  PostInfo postInfo;

  noticeItem({required this.postInfo});

  String _text(String title) {
    if (title.length > 10) {
      return title.substring(0, 10) + '...';
    } else {
      return title;
    }
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Get.to(PostViewPage(postInfo: postInfo));
      },
      child: Padding(
          padding: EdgeInsets.only(left: 18, right: 31, top: 10, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 33,
                height: 19,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff3648EB)),
                child: Center(
                  child: Text(
                    '공지',
                    style: f10w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(_text(postInfo.title), style: f12bw700),
              ),
              Spacer(),
              Text(postInfo.date as String, style: f8gw500),
            ],
          )),
    );
  }

}

class tabCategory extends StatelessWidget {
  final String tabImage;
  final String tabName;

  const tabCategory({Key? key, required this.tabImage, required this.tabName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Row(
      children: [
        Container(
          width: 24,
          height: 24,
          child: SvgPicture.asset(tabImage),
        ),
        const SizedBox(width: 5),
        Text(tabName, style: f9bw700)
      ],
    ));
  }
}

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  //탭바 색깔 조정
  final TabBar tabBar;
  final BoxDecoration decoration;

  DecoratedTabBar({required this.tabBar, required this.decoration});

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}
