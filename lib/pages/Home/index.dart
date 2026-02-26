import 'package:flutter/material.dart';
import 'package:hm_store_app/api/home.dart';
import 'package:hm_store_app/components/Home/HmCategory.dart';
import 'package:hm_store_app/components/Home/HmHot.dart';
import 'package:hm_store_app/components/Home/HmMoreList.dart';
import 'package:hm_store_app/components/Home/HmSlider.dart';
import 'package:hm_store_app/components/Home/HmSuggestion.dart';
import 'package:hm_store_app/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [];
  List<CategoryItem> _categoryList = [];
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      HmMoreList(),
    ];
  }

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
  }

  Future<void> _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryListAPI();
    setState(() {});
    print(_categoryList);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
