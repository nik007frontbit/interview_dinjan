import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interview_dinjan/getx/createmail.dart';

class CreateMail extends StatefulWidget {
  int index;

  CreateMail({super.key, required this.index});

  @override
  State<CreateMail> createState() => _CreateMailState();
}

class _CreateMailState extends State<CreateMail> {
  final controller = Get.put(CreateMailController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchData(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset("assets/appbar/Close.png"))),
        actions: [
          GestureDetector(
            onTap: () {
              controller.addData(widget.index,
                  controller.textController.value.text.toString());
              showDialog(
                  barrierColor: Colors.white.withOpacity(0.78),
                  context: context,
                  builder: (context) => OverViewScreen(
                      text: controller.textController.value.text.toString()));
            },
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset("assets/appbar/Send.png")),
          ),
        ],
      ),
      backgroundColor: Colors.white.withOpacity(0.5),
      body: Column(
        children: [
          Container(
            height: 288,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.only(
              right: 24,
              top: 40,
              left: 24,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFC7C7CC)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() => TextField(
                          maxLength: 240,
                          controller: controller.textController.value,
                          onChanged: (value) {
                            if (value.length > 240) {
                              controller.textController.value.text =
                                  value.substring(0, 239);
                            } else {
                              controller.textLength.value = value.length;
                            }
                          },
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "What are you worried about?",
                              hintStyle: TextStyle(color: Color(0xFF8E8E93)),
                              counterText: ""),
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(
                          15,
                        ),
                        child: Image.asset("assets/common/sender.png")),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/common/tips.png"),
              RotationTransition(
                  turns: const AlwaysStoppedAnimation(-5 / 360),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF8E8E93),
                        borderRadius: BorderRadiusDirectional.circular(14)),
                    margin: const EdgeInsets.all(
                      15,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Obx(() => Text(
                          "${controller.textLength}/240",
                          style: const TextStyle(color: Colors.white),
                        )),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class OverViewScreen extends StatelessWidget {
  OverViewScreen({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 20,
            ),
            child: Image.asset("assets/appbar/Close.png"),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset("assets/common/Report.png")),
          ),
        ],
      ),
      backgroundColor: Colors.white.withOpacity(0.5),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/common/See Request.png")),
          Container(
            padding: const EdgeInsets.only(
              right: 24,
              left: 24,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFC7C7CC)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(
                          15,
                        ),
                        child: Image.asset("assets/common/ssendder2.png")),
                  ],
                ),
                Text(
                  text,
                  textAlign: TextAlign.justify,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(
                          15,
                        ),
                        child: Image.asset("assets/common/reply.png")),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("assets/common/Viewing Done.png"),
            ],
          )
        ],
      ),
    );
  }
}
