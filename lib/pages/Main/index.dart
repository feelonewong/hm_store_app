import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hm_store_app/pages/Cart/index.dart';
import 'package:hm_store_app/pages/Category/index.dart';
import 'package:hm_store_app/pages/Home/index.dart';
import 'package:hm_store_app/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _tabList = [
      {
        "icon": "lib/assets/home_normal.png",
        "active_icon": "lib/assets/home_active.png",
        "text": "首页",
      },
      {
        "icon": "lib/assets/pro.png",
        "active_icon": "lib/assets/pro_active.png",
        "text": "分类",
      },
      {
        "icon": "lib/assets/cart.png",
        "active_icon": "lib/assets/cart_active.png",
        "text": "购物车",
      },
      {
        "icon": "lib/assets/my.png",
        "active_icon": "lib/assets/my_active.png",
        "text": "我的",
      },
    ];
    List<BottomNavigationBarItem> items = _tabList.map((item) {
      return BottomNavigationBarItem(
        icon: Image.asset(item['icon']!, width: 30, height: 30),
        activeIcon: Image.asset(item['active_icon']!, width: 30, height: 30),
        label: item['text'],
      );
    }).toList();
    List<Widget> _getChildren(){
      return [
        HomeView(), 
        CategoryView(), 
        CartView(), 
        MineView()
      ];
    }
    return Scaffold(
      body: SafeArea(child:IndexedStack(
        index: _currentIdx,
        children: _getChildren(),
      )),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF000000),
        unselectedItemColor: Color(0xFF000000),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIdx,
        onTap: (value) {
          _currentIdx = value;
          setState(() {});
        },
        items: items,
      ),
    );
  }
}
