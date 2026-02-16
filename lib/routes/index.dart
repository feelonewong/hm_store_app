

import 'package:flutter/material.dart';
import 'package:hm_store_app/pages/Login/index.dart';
import 'package:hm_store_app/pages/Main/index.dart';

Widget getRooteWidget() {
  return MaterialApp(
    initialRoute: '/',
    routes: getRoutes(),
  );
}


Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    '/': (context) => MainPage(),
    '/login': (context) => LoginPage(),
  };
}