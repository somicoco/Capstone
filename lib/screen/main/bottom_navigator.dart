import 'package:circlet/screen/login_register/add_github_page.dart';
import 'package:circlet/screen/login_register/add_portfolio_page.dart';
import 'package:circlet/screen/login_register/login/login_page.dart';
import 'package:circlet/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> with TickerProviderStateMixin {
  List<Widget> _widgetOptions = [];
  late TabController _bottomTabController;
  int _currentIndex = 0;


  @override
  void initState() {
    super.initState();
    _widgetOptions = [LoginPage(),AddGithubPage(),AddPortFolioPage(),LoginPage()];
    _bottomTabController = TabController(length: 5, vsync: this);
    _currentIndex = 0;
    setState(() {});
    // _bottomTabController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(''),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: grayColor),
          ),
        ),
        child: TabBar(
          onTap: (index){
            setState(() {
              _currentIndex = index;

              Get.to(()=> _widgetOptions[_currentIndex]);
            });
          },
          indicatorColor: mainColor,
          indicatorSize: TabBarIndicatorSize.label,
          controller: _bottomTabController,
          unselectedLabelStyle: TextStyle(fontSize: 8,fontFamily: 'NotoSans'),
          labelStyle: TextStyle(fontSize: 8,fontFamily: 'NotoSans'),
          unselectedLabelColor: Colors.grey,
          labelColor: const Color(0xff3D6177),

          tabs: <Widget>[
            GestureDetector(
              onTap: ()async{},
              child : Tab(
                icon: SvgPicture.asset(
                  'assets/icon/bottom_navi/study.svg',
                  width: 24, // 아이콘 크기를 조정할 수 있습니다.
                  height: 24,
                ),
                text: '스터디',

              ),
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/icon/bottom_navi/cafe.svg',
                width: 24, // 아이콘 크기를 조정할 수 있습니다.
                height: 24,
              ),
              text: '주변카페',
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/icon/bottom_navi/lounge.svg',
                width: 24, // 아이콘 크기를 조정할 수 있습니다.
                height: 24,
              ),
              text: '라운지',
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/icon/bottom_navi/chatting.svg',
                width: 24, // 아이콘 크기를 조정할 수 있습니다.
                height: 24,
              ),
              text: '채팅',
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/icon/bottom_navi/profile.svg',
                width: 24, // 아이콘 크기를 조정할 수 있습니다.
                height: 24,
              ),
              text: '프로필',
            )
          ],
        ),
      ),
    );
  }
}
