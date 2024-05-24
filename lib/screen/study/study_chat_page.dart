import 'package:circlet/screen/profile/user/user_profile_page.dart';
import 'package:circlet/util/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../components/components.dart';


class StudyChatPage extends StatefulWidget {
  StudyInfo studyInfo;

  StudyChatPage({required this.studyInfo});

  @override
  _StudyChatPageState createState() => _StudyChatPageState();
}

class _StudyChatPageState extends State<StudyChatPage> {
  final List<Message> messages = [];
  final TextEditingController textEditController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool timeNotice = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {}

  void _sendMessage() {
    if (textEditController.text.isNotEmpty) {
      setState(() {
        messages.add(Message(textEditController.text, true,'나'));
        textEditController.clear();
      });
      _scrollToBottom();
    }
  }

  void _receiveMessage() {
    if (textEditController.text.isNotEmpty) {
      setState(() {
        messages.add(Message(textEditController.text, false,'둘리'));
        textEditController.clear();
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              child: Text(
                widget.studyInfo.studyName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 9),
            Text('${widget.studyInfo.members}', style: f20gw500),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 13),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/icon/Vector.svg'),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(
            color: Color(0xffEBEBEB),
            height: 1,
            thickness: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final bool showProfile = index == 0 || messages[index - 1].userId != message.userId; // 처음으로 보내는 사람이 아니거나 연속으로 보내는 사람이 아니면 프로필 나타냄
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    mainAxisAlignment: message.isUserMessage
                        ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      (!message.isUserMessage  && showProfile) ?  // 메시지를 보낸사람이 내가 아니고 다른사람일 때 and 연속으로 보낸게 아닐 때
                        Padding(
                          padding: EdgeInsets.only(right: 10, top: 15),
                          child: GestureDetector(
                            onTap: (){
                              Get.to(UserProfilePage());
                            },
                            child: Container(
                              width: 41,
                              height: 41,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset(
                                  'assets/image/example/profile_pic2.png'),
                            ),
                          )
                        ):
                        Padding(
                          padding: EdgeInsets.only(right: 10,top: 15),
                          child: Container(
                            width: 41,
                            height: 41,
                          ),
                        ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          if (!message.isUserMessage && showProfile)
                            Padding(padding: EdgeInsets.only(top: 15),
                            child: Text(
                              '둘리',
                              style: f12bw500,
                            ),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              message.isUserMessage ? Text('오전 11:09', style: f8bw500) : SizedBox(),
                              // Padding(
                              //   padding: EdgeInsets.only(top: 4, right: 9),
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(
                              //         vertical: 3, horizontal: 15),
                              //     decoration: BoxDecoration(
                              //       color: Color(0xffEFEFEF),
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //     child: Text(
                              //       message.text,
                              //       style: f12bw500,
                              //     ),
                              //   ),
                              // ),
                              !message.isUserMessage ? Text('오전 11:09', style: f8bw500) : SizedBox(),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 2, bottom: 14),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 14),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Color(0xffEBEBEB),
                  ),),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 38,
                        child: TextField(
                          controller: textEditController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF2F2F2),
                            hintText: '메시지 보내기',
                            hintStyle: TextStyle(
                                fontSize: 11,
                                fontFamily: 'NotoSans',
                                fontWeight: FontWeight.w500),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onDoubleTap: () {
                        _receiveMessage();
                      },
                      onTap: () {
                        _sendMessage();
                      },
                      child: SvgPicture.asset('assets/icon/send.svg'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
