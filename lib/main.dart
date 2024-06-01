import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:interview_dinjan/getx/home.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('mail_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueAccent.withOpacity(0.1),
              Colors.white,
              Colors.white,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Obx(() => controller.screens[controller.index.value])),

      bottomNavigationBar: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 12,
              width: double.infinity,
              color: Color(0xFF252526).withOpacity(0.2),
            ),
            Obx(() => BottomNavigationBar(
                  currentIndex: controller.index.value,
                  onTap: (value) {
                    if (value != 2) {
                      controller.index.value = value;
                    } else {
                      controller.showActionSheet(context);
                    }
                  },
                  items: List.generate(
                    3,
                    (index) => BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/bottom/$index.png",
                        height: 56,
                        width: 56,
                      ),
                      activeIcon: Image.asset(
                        "assets/bottom/$index$index.png",
                        height: 59,
                        width: 59,
                      ),
                      label: "",
                    ),
                  ),
                )),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
