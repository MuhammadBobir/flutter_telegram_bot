

import 'package:flutter_telegram_bot/config/import.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  init() async {
    var user = await GetStorage().read('user');
    await Future.delayed(const Duration(seconds: 2));
    if (user != null) {
      Get.off(() => const HomePage());
    } else {
      Get.off(() => const LoginPage());
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hush kelibsiz"),
      ),
    );
  }
}
