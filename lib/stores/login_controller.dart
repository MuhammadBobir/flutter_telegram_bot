import 'package:flutter_telegram_bot/config/import.dart';

class LoginController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  GetStorage base = GetStorage();

  validate() {
    return name.text.trim().isEmpty ||
        phone.text.trim().isEmpty ||
        login.text.trim().isEmpty ||
        password.text.trim().isEmpty;
  }

  loginFunction() async {
    if (validate()) {
      Get.snackbar("Error", "Ma'lumotlarni to'liq kiriting",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    Map user = {
      "name": name.text,
      "phone": phone.text,
      "login": login.text,
      "password": password.text,
    };
    await base.write('user', user);
    Get.to(() => const HomePage());
  }
}
