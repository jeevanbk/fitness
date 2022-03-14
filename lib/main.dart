import 'package:fitness_app/src/binding/dashboard.dart';
import 'package:fitness_app/src/screens/home/home.dart';
import 'package:fitness_app/src/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        title: 'Fitness',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.system,
        initialRoute: Splash.route,
        getPages: [
          GetPage(
            name: Splash.route,
            page: () => const Splash(),
          ),
          GetPage(
            name: Home.route,
            page: () => const Home(),
            binding: DashBoard(),
            transition: Transition.cupertino,
          ),
        ],
      ),
      designSize: Size(375, 667),
    );
  }
}
