import 'package:fitness_app/src/screens/home/home.dart';
import 'package:fitness_app/src/utils/animate.dart';
import 'package:fitness_app/src/utils/font_style.dart';
import 'package:fitness_app/src/utils/image_path.dart';
import 'package:fitness_app/src/utils/strings.dart';
import 'package:fitness_app/src/widgets/show_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _visible = false;
  bool align = false;

  @override
  void initState() {
    super.initState();
    initSetup().then((_) async {
      // Once setup is complete then load the animation
      _startAnimation();
    });
  }

  Future<void> _startAnimation() async {
    setState(() => align = !align);
    await Future.delayed(const Duration(milliseconds: 100));
    setupComplete();
  }

  Future<void> initSetup() {
    return Future.delayed(const Duration(seconds: 2));
  }

  Future<void> setupComplete() async {
    setState(() => _visible = true);
    await Future.delayed(const Duration(seconds: 1));
    Get.toNamed(Home.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(210, 85)),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // animate the pin logo on the screen
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 500),
                    alignment:
                        align ? const Alignment(0.615, 0) : Alignment.center,
                    child: const ShowImage(
                      imagePath: ImagePathCommon.splashI,
                    ),
                  ),
                  // animate the boozin logo on the screen
                  if (align)
                    AnimateWithBlink(
                      visible: _visible,
                      child:
                          ShowImage(imagePath: ImagePath(context).splashBoozin),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            // animate the fitness text on the screen
            AnimateWithBlink(
              visible: _visible,
              child: const Text(
                AppText.fitness,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFont.nunito,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
