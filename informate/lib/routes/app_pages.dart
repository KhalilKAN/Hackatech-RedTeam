import 'package:get/get.dart';
import 'package:informate/bindings/home_binding.dart';
import 'package:informate/pages/home/home_page.dart';

import 'package:informate/routes/app_routes.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      binding: HomeBinding(),
      page: () => HomePage(),
    ),
  ];
}
