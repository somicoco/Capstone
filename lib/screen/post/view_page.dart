import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewPage extends StatefulWidget {
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('게시글asdasdasdasdas  ')),
        actions: [
          GestureDetector(
            onTap: (){
              print('옵션클릭');
            },
            child: SvgPicture.asset('assets/icon/category.svg'),
          )
        ],
      ),
    );
  }

}