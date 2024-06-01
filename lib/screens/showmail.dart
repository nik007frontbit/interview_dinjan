import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_dinjan/getx/show_maails.dart';

class ShowMail extends StatefulWidget {
  const ShowMail({super.key});

  @override
  State<ShowMail> createState() => _ShowMailState();
}

class _ShowMailState extends State<ShowMail> {
  final controller = Get.put(ShowMailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchData();
    controller.list.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 80,
                bottom: 10,
              ),
              child: Text(
                "Reply",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Stack(
                  children: [
                    Positioned(
                        top: 146.05,
                        left: 0,
                        right: 0,
                        child: Image.asset("assets/common/Rectangle 143.png")),
                    Positioned(
                        top: 85,
                        left: 0,
                        right: 0,
                        child: Image.asset("assets/common/Rectangle 145.png")),
                    Positioned(
                        top: 29,
                        left: 0,
                        right: 0,
                        child: Image.asset("assets/common/Rectangle 144.png")),
                    Positioned(
                        left: 0,
                        right: 0,
                        child: Image.asset("assets/common/Basic.png")),
                  ],
                ),
                Positioned(
                    bottom: 10,
                    left: 50,
                    right: 50,
                    child: Image.asset("assets/common/navigation.png")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
