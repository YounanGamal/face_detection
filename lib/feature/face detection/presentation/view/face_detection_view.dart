import 'package:face_detection/feature/face%20detection/presentation/view/widgets/face_detection_view_body.dart';
import 'package:flutter/material.dart';

class FaceDetectionView extends StatelessWidget {
  const FaceDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Face Detection'),
        // centerTitle: true,
        // backgroundColor: Colors.blue,
      ),
      body: SafeArea(child: FaceDetectionViewBody()),
    );
  }
}
