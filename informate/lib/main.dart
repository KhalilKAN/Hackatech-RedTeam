import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:informate/bindings/home_binding.dart';
import 'package:informate/pages/home/home_page.dart';

import 'package:informate/routes/app_pages.dart';
import 'package:informate/routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.home,
    // theme: appThemeData,
    defaultTransition: Transition.fade,
    initialBinding: HomeBinding(),
    getPages: AppPages.pages,
    home: HomePage(),
  ));
}
