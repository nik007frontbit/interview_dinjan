import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class ShowMailsController extends GetxController {
  RxList list = [].obs;
  RxInt index = 0.obs;

  fetchData() {
    final mailBox = Hive.box("mail_box");
    for (int i = 0; i < 8; i++) {
      list.add(mailBox.get("$i") ?? "NUll data");
    }
    list.refresh();
  }
}
