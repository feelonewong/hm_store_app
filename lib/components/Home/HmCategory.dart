import 'package:flutter/material.dart';
import 'package:hm_store_app/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  const HmCategory({super.key, required this.categoryList});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    // 返回横向滚动的组件
    return Container(
      width: 80,
      height: 100,
      alignment: Alignment.center,

      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: widget.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final category = widget.categoryList[index];
          return Container(
            width: 80,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  category.picture,
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
                Text(category.name, style: TextStyle(color: Colors.black)),
              ],
            ),
          );
        },
      ),
    );
  }
}
