import 'package:get/get.dart';
import 'package:marketplace/domain/repository/user_repository.dart';

class MenuController extends GetxController {
  final userRepository = Get.find<UserRepository>();

  final _receivedNotificationSwitch = true.obs;
  get receivedNotificationSwitch => _receivedNotificationSwitch.value;
  set receivedNotificationSwitch(value) =>
      _receivedNotificationSwitch.value = value;

  final _receivedNewsletterSwitch = false.obs;
  get receivedNewsletterSwitch => _receivedNewsletterSwitch.value;
  set receivedNewsletterSwitch(value) =>
      _receivedNewsletterSwitch.value = value;
}
