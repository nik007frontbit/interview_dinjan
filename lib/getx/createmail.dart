import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CreateMailController extends GetxController {
  Rx<TextEditingController> textController = TextEditingController().obs;
  RxInt textLength = TextEditingController().text.length.obs;

  fetchData(int index) {
    final mailBox = Hive.box("mail_box");
    final curVal = mailBox.get("$index");
    if (curVal != null) {
      textController.value.text = curVal.toString();
    } else {
      textController.value.text = "";
    }
  }

  addData(int index, String text) {
    final mailBox = Hive.box("mail_box");
    final curVal = mailBox.get("$index");

    mailBox.put("$index", text);
  }
}
