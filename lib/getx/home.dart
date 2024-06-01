import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_dinjan/screens/mail_setting.dart';
import 'package:interview_dinjan/screens/mailbox.dart';
import 'package:interview_dinjan/screens/showmail.dart';

class HomeScreenController extends GetxController {
  RxInt index = 0.obs;
  RxList screens = [
    MailBoxScreen(),
    ShowMail(),
  ].obs;

  void showActionSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(contentPadding: EdgeInsets.all(16),
                
                title: const Text('What time each day?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    )),
                trailing: GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    "assets/notifficaation/close.png",
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisExtent: 120,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/notifficaation/$index.png",
                    height: 120,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  "assets/notifficaation/back.png",
                  height: 120,
                ),
              ),
            ],
          );
        });
  }
}
