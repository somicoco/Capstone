import 'dart:io';

import 'package:flutter/material.dart';

import '../../components/components.dart';

class PostImagePage extends StatefulWidget {
  @override
  State<PostImagePage> createState() => _PostImagePageState();

  PostInfo postInfo;

  PostImagePage({required this.postInfo});
}

class _PostImagePageState extends State<PostImagePage> {
  final PageController controller = PageController();
  int idx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${idx} / ${widget.postInfo.imagePaths.length}'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: widget.postInfo.imagePaths.length,
        onPageChanged: (int padgeIndex) {
          setState(() {
            idx = padgeIndex + 1;
          });
        },
        itemBuilder: (context, index) => Container(
          color: Colors.black,
          child: Image.file(widget.postInfo.imagePaths[index] as File),
        ),
      ),
    );
  }
}