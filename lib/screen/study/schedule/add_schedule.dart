import 'package:circlet/components/components.dart';
import 'package:circlet/screen/cafe/cafe_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../util/color.dart';
import '../../../util/font/font.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

enum Status { onLine, offLine }

class _AddScheduleState extends State<AddSchedule> {
  Status _status = Status.onLine;
  DateFormat dayFormatter = DateFormat('yyyy.MM.dd EEEE', 'ko_KR');
  DateFormat timeFormatter = DateFormat('a h시 mm분', 'ko_KR');
  DateTime? selectedDay;
  DateTime now = DateTime.now();

  //DateTime? selectedTime;

  final List<String> _items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15'
  ];
  String manageValue = '1';
  TextEditingController scheduleNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  int a = 0;
  int b = 0;

  @override
  void initState() {
    super.initState();
    selectedDay = DateTime(now.year, now.month, now.day, now.hour, 0);

    dateController.text = dayFormatter.format(now);
    timeController.text = timeFormatter.format(selectedDay!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '일정 추가',
          style: f22bw500,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1), // Divider의 높이 설정
          child: Divider(
            color: Color(0xffEBEBEB), // Divider의 색상 설정
            height: 1, // Divider의 높이 설정
            thickness: 1, // Divider의 두께 설정
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:17,left: 14, right: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '일정명',
                    style: f17bw500,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormBox(
                    hintText: '일정명을 입력해 주세요.',
                    textController: scheduleNameController,
                    onTap: () {},
                    onChange: (v) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    '일시',
                    style: f17bw500,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (a == 1) {
                            a = 0;
                          } else {
                            b = 0;
                            a = 1;
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: lightGrayColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: Center(
                                child: Text(
                              dateController.text,
                              style: f14bw500,
                            )),
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (b == 1) {
                            b = 0;
                          } else {
                            a = 0;
                            b = 1;
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: lightGrayColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Center(
                                child: Text(
                              timeController.text,
                              style: f14bw500,
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                  a == 1
                      ? Padding(
                          padding: EdgeInsets.only(left: 12, right: 12),
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
                                    selectedDay = DateTime(
                                      _selectedDay.year,
                                      _selectedDay.month,
                                      _selectedDay.day,
                                      selectedDay!.hour,
                                      selectedDay!.minute,
                                      selectedDay!.second,
                                    );

                                    dateController.text =
                                        dayFormatter.format(selectedDay!);
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
                        )
                      : b == 1
                          ? Expanded(
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: DateTime(1969, 1, 1, DateTime.now().hour, DateTime.now().minute),
                              use24hFormat: false,
                              minuteInterval: 1, onDateTimeChanged: (DateTime value) {  },
                  ),
                          )
                  // TimePickerSpinner(
                  //             time: selectedDay,
                  //             is24HourMode: false,
                  //             normalTextStyle: f14gw500,
                  //             highlightedTextStyle: f14bw500,
                  //             onTimeChange: (time) {
                  //               setState(() {
                  //                 selectedDay = time;
                  //                 timeController.text =
                  //                     timeFormatter.format(selectedDay!);
                  //               });
                  //             },
                  //           )
                          : Container(),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    '인원수',
                    style: f17bw500,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DropDownService(
                      width: 120,
                      item: _items,
                      onChange: (v) {
                        setState(() {
                          manageValue = v as String;
                        });
                      },
                      selectedValue: manageValue),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    '일정 형태',
                    style: f17bw500,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('온라인'),
                    leading: Radio<Status>(
                      activeColor: mainColor,
                      value: Status.onLine,
                      groupValue: _status,
                      onChanged: (Status? value) {
                        setState(() {
                          _status = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('오프라인'),
                    leading: Radio<Status>(
                      activeColor: mainColor,
                      value: Status.offLine,
                      groupValue: _status,
                      onChanged: (Status? value) {
                        setState(() {
                          _status = value!;
                        });
                      },
                    ),
                  ),
                  _status == Status.onLine
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'URL',
                              style: f17w500HintGray,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormBox(
                              hintText: '외부링크가 있다면 링크를 첨부해주세요.',
                              textController: urlController,
                              onTap: () {},
                              onChange: (v) {
                                setState(() {});
                              },
                            ),
                          ],
                        )
                      : _status == Status.offLine
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '장소',
                                style: f17bw500,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(CafeMain(), arguments: locationController.text);
                                  },
                                  child: Container(
                                    width: Get.width,
                                    height: 56,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          width: 1.5,
                                          color: Color(0xffEBEBEB),
                                        )),
                                    child: Center(
                                        child: Text(locationController.text == ""
                                            ? '장소의 위치를 추가해주세요.'
                                            : locationController.text,
                                        style: f14w300HintGray,)),
                                  ),
                                ),
                            ],
                          )
                          : Container(),
                  SizedBox(height: 150),
                ],
              ),
            ),
            ButtonStyle1(text: '등록하기', ontap: (){})
          ],
        ),
      ),
    );
  }
}
