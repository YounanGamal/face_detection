import 'package:face_detection/core/route/generate_routes.dart';
import 'package:face_detection/core/route/page_route_name.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FaceDetection());
}

class FaceDetection extends StatelessWidget {
  const FaceDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GenerateRoutes.onGenerator,
      initialRoute: PageRouteName.initial,
    );
  }
}
