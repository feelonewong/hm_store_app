import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        icon: Image.asset(item['icon']!, width: 24, height: 24),
        activeIcon: Image.asset(item['active_icon']!, width: 24, height: 24),
        label: item['text'],
      );
    }).toList();
    return Scaffold(
      body: Center(child: Text('Main Page')),
      bottomNavigationBar: BottomNavigationBar(items: items),
    );
  }
}
