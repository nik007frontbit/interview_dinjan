import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_dinjan/getx/mailbox.dart';
import 'package:interview_dinjan/screens/create_mail.dart';

class MailBoxScreen extends StatelessWidget {
  MailBoxScreen({super.key});

  final controller = Get.put(MailBoxController());

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
                "Mailbox",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisExtent: 160),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                showDialog(
                    barrierColor: Colors.white.withOpacity(0.78),
                    context: context,
                    builder: (context) => CreateMail(
                          index: index,
                        ));
              },
              child: Image.asset(
                controller.images[index],
                height: 95,
                width: 160,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
