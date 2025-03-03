import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:face_detection/feature/face%20detection/presentation/view/face_detection_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Transform.scale(
        scale: 3,
        child: Lottie.asset('assets/lottie/Animation.json'),
      ),
      nextScreen: FaceDetectionView(),
      backgroundColor: Colors.black,
    );
  }
}
