import 'package:get/get.dart';

class MailBoxController extends GetxController {
  RxList images = List.generate(8, (index) => "assets/mailbox/$index.png").obs;
}
