import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  const HmMoreList({super.key});

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // 设置网格2列
        crossAxisCount: 2,
        mainAxisSpacing: 10, //主轴间距为10
        crossAxisSpacing: 10, // 交叉轴间距为10
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(color: Colors.black),
          child: Text('无线加载模块', style: TextStyle(color: Colors.white)),
        );
      },
    );
  }
}
