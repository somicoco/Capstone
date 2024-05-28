import 'package:circlet/provider/schedule_state.dart';
import 'package:circlet/screen/study/schedule/schedule_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../components/components.dart';
import '../../../util/color.dart';
import '../../../util/font/font.dart';

class ShowSchedule extends StatefulWidget {
  const ShowSchedule({super.key});

  @override
  State<ShowSchedule> createState() => _ShowScheduleState();
}

class _ShowScheduleState extends State<ShowSchedule> {
  List<Map<String, dynamic>> scheduleList = [
    {
      'title': 'IOS 개발 스터디를 같이 하실 분 모집합니다.모집합니다.........',
      'type': 'offLine',
      'location': '대전 유성구 계룡로105번길 28 지상 1, 2, 3층',
      'x': "36.35459936557631",
      'y': "127.34319877817298",
      'date': '2024-05-22 12:30:00.000',
      'maxParticipants': '10', // 최대 인원수
      'currentParticipants': ['Alice', 'Bob', 'Charlie','Lee','Jason'] // 현재 참여자 리스트
    },
    {
      'title': '플러터 개발 스터디',
      'type': 'onLine',
      'location': '대전 유성구 월드컵대로351번길 5 2층',
      'x': "36.35496663822858",
      'y': "127.34239823687092",
      'date': '2024-05-22 12:30:00.000',
      'maxParticipants': '8', // 최대 인원수
      'currentParticipants': ['Dave', 'Eve'] // 현재 참여자 리스트
    }
  ];
  final ss = Get.put(ScheduleState());
  DateFormat dayFormatter = DateFormat('M월 dd일 EEEE', 'ko_KR');
  DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  DateFormat formatter = DateFormat('yyyy.MM.dd(E) HH:mm', 'ko_KR');
  DateTime selectedDay = DateTime.now();
  DateTime now = DateTime.now();
  String? data;
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(text: '스터디 일정'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TableCalendar(
                focusedDay: now,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2025, 01, 01),
                locale: 'ko_KR',
                weekendDays: [DateTime.sunday, 7],
                daysOfWeekHeight: 30,
                rowHeight: 35,

                /// 선택된 날짜를 달력에 반영
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay, day);
                },

                /// 선택된 날짜의 상태 갱신
                onDaySelected: (_selectedDay, _focusedDay) {
                  if (!isSameDay(selectedDay, _selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      selectedDay = _selectedDay;

                    });
                  }
                },
                headerStyle: HeaderStyle(
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: mainColor,
                      size: 28,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: mainColor,
                      size: 28,
                    ),
                    formatButtonVisible: false,
                    titleCentered: true),
                calendarStyle: CalendarStyle(
                  // cellMargin: EdgeInsets.only(bottom: 2),
                  todayDecoration: BoxDecoration(

                    // color: Colors.transparent,

                  ),
                  todayTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSameDay(DateTime.now(), selectedDay)
                        ? whiteColor
                        : mainColor,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: isSameDay(DateTime.now(), selectedDay)
                        ? mainColor
                        : Color(0xff81ACEC),
                    shape: BoxShape.circle,
                  ),
                )),
          ),
          SizedBox(height: 30,),
          Expanded(
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: lightGrayColor
                ),
              child: Padding(
                padding: EdgeInsets.only(top:13, left: 23, right: 23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${dayFormatter.format(selectedDay)}', style: f16bw500,),
                    SizedBox(height: 20,),
                    Expanded(
                        child: ListView.builder(
                            itemCount: scheduleList.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      ss.a1.value = scheduleList[index]['date'];
                                      print(scheduleList[index]['type']);
                                      //Get.to(TestPage2());
                                      Get.to(()=>ScheduleDetail(),arguments: scheduleList[index]);
                                      setState(() {

                                      });
                                    },
                                    /// 일정별 컨테이너
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffF1F1F1),
                                            blurRadius: 10,
                                            offset: Offset(0, 4),
                                          ),
                                          BoxShadow(
                                            color: Color(0xffF5F5F5),
                                            blurRadius: 10,
                                            offset: Offset(0, 2),
                                          ),
                                          BoxShadow(
                                            color: Color(0xffDDDDDD),
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 23,right: 15, top: 11, bottom: 14),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            /// 오프라인, 온라인 여부
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: scheduleStatusBackColor[scheduleList[index]['type']],
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                                                    child: Text(scheduleList[index]['type']=='onLine'?'온라인':'오프라인',
                                                      style: TextStyle(
                                                        color: scheduleStatusTextColor[scheduleList[index]['type']],
                                                        fontFamily: 'NotoSans',
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 10,
                                                    ),),
                                                  ),
                                                ),
                                                Spacer(),
                                                Text('자세히', style: f10hgw400,),
                                                Icon(Icons.chevron_right,
                                                  color: hintGrayColor,
                                                  size: 20,)


                                              ],
                                            ),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                              scheduleList[index]['title'],
                                              style: f15bw500,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Text(formatter.format(inputFormat.parse(scheduleList[index]['date'])), style: f10bw400,),
                                                SizedBox(width: 25,),
                                                SizedBox(width: 14,child: SvgPicture.asset('assets/icon/bottom_navi/lounge.svg',)),
                                                SizedBox(width: 6,),
                                                Text('${scheduleList[index]['currentParticipants'].length}'+'/'+scheduleList[index]['maxParticipants'],style: f10bw400,),
                                              ],
                                            ),


                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  )
                                ],
                              );

                            }))
                  ],

                ),
              ),
              ))


        ],
      ),
    );
  }
}
