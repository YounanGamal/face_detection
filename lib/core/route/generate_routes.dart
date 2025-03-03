import 'package:face_detection/core/route/page_route_name.dart';
import 'package:face_detection/feature/face%20detection/presentation/view/face_detection_view.dart';
import 'package:face_detection/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

class GenerateRoutes {
  static Route<dynamic> onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.faceDetection:
        return MaterialPageRoute(
          builder: (context) => FaceDetectionView(),
          settings: settings,
        );
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
          settings: settings,
        );
    }
  }
}
