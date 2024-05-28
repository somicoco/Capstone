import 'package:circlet/util/color.dart';
import 'package:circlet/util/full_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../components/components.dart';
import '../../../provider/schedule_state.dart';
import '../../../util/font/font.dart';

class ScheduleDetail extends StatefulWidget {
  const ScheduleDetail({super.key});

  @override
  State<ScheduleDetail> createState() => _ScheduleDetailState();
}

class _ScheduleDetailState extends State<ScheduleDetail> {
  DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  DateFormat formatter = DateFormat('yyyy.MM.dd(E) HH:mm', 'ko_KR');
  late NaverMapController _mapController;
  late Map<String, dynamic> schedule;
  bool _isLoading = true;
  bool check = false;

  @override
  void initState() {
    // initState에서 데이터 가져오기
    schedule = Get.arguments;
    Future.delayed(Duration.zero, () async {
      await initialize();

      _isLoading = false;

      setState(() {});
    });
    super.initState();
  }

  Future<void> initialize() async {
    print("initializeMap!!");
    await NaverMapSdk.instance.initialize(
        clientId: 'x8zt11e9za',
        onAuthFailed: (ex) {
          print("********* 네이버맵 인증오류 : $ex *********");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        text: '${schedule['title']}',
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.only(top: 16, left: 12, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '일시',
                          style: f15bw500,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          formatter.format(inputFormat.parse(schedule['date'])),
                          style: f12bw500,
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '일정형태',
                              style: f15bw500,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    scheduleStatusBackColor[schedule['type']],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                child: Text(
                                  schedule['type'] == 'onLine' ? '온라인' : '오프라인',
                                  style: TextStyle(
                                    color: scheduleStatusTextColor[
                                        schedule['type']],
                                    fontFamily: 'NotoSans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        Text(
                          '장소',
                          style: f15bw500,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(schedule['location'], style: f12bw500),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: (){
                              print('클릭클릭');
                              Get.to(()=>FullMapScreen());
                            },
                            child: Container(
                              width: Get.width,
                              height: 255,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1, color: grayColor2),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: NaverMap(
                                  onMapTapped: (point, latLng){
                                    print('클릭클릭');
                                    Get.to(()=>FullMapScreen(), arguments: schedule);


                                  },
                                  options: NaverMapViewOptions(
                                    tiltGesturesEnable: true,
                                    scrollGesturesEnable: false,
                                    locationButtonEnable: false,
                                    /// 내위치 버튼
                                    zoomGesturesEnable: false,
                                    /// 줌제한
                                    extent: NLatLngBounds(
                                      /// 지도 영역 한반도 인근으로 제한
                                      southWest: NLatLng(31.43, 122.37),
                                      northEast: NLatLng(44.35, 132.0),
                                    ),
                                    initialCameraPosition: NCameraPosition(
                                        target: NLatLng(
                                            double.parse('${schedule['x']}'),
                                            double.parse('${schedule['y']}')),
                                        zoom: 13,
                                        bearing: 0,
                                        tilt: 0),
                                  ),
                                  onMapReady: (controller) async {
                                    _mapController = controller;

                                    var locationMarker = NMarker(
                                        id: '1',
                                        position: NLatLng(
                                            double.parse('${schedule['x']}'),
                                            double.parse('${schedule['y']}')));
                                    _mapController.addOverlay(locationMarker);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '참여인원',
                              style: f15bw500,
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Text(
                              '${schedule['currentParticipants'].length}',
                              style: f14rw500,
                            ),
                            Text(
                              '/' + '${schedule['maxParticipants']}',
                              style: f14bw500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: schedule['currentParticipants'].length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 18, right: 18),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle, // 원형 모양으로 설정
                                          border: Border.all(
                                            color: Colors.black, // 테두리 색상 설정
                                            width: 1, // 테두리 두께 설정
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          //radius: 20, // 반지름 설정
                                          backgroundImage: AssetImage(
                                              'assets/image/testImage.png'), // 이미지 설정
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                          '${schedule['currentParticipants'][index]}')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Color(0xffEBEBEB), // Divider의 색상 설정
                                    height: 1, // Divider의 높이 설정
                                    thickness: 1, // Divider의 두께 설정
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
      bottomSheet: ButtonStyle1(text: '신청하기', ontap: () { schedule['currentParticipants'].add('sdf'); setState(() {

      });},),
    );
  }
}
