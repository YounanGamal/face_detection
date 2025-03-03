import 'dart:io';
import 'package:face_detection/core/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

class FaceDetectionViewBody extends StatefulWidget {
  const FaceDetectionViewBody({super.key});

  @override
  State<FaceDetectionViewBody> createState() => _FaceDetectionViewBodyState();
}

class _FaceDetectionViewBodyState extends State<FaceDetectionViewBody> {
  File? _image;
  List<Face> faces = [];
  final picker = ImagePicker();

  Future pickImage(ImageSource source) async {
    try {
      final image = await picker.pickImage(source: source);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      });
      if (_image != null) {
        await _detectFaces(_image!);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future _detectFaces(File img) async {
    try {
      final options = FaceDetectorOptions();
      final faceDetection = FaceDetector(options: options);
      final inputImage = InputImage.fromFilePath(img.path);
      List<Face> detectedFaces = await faceDetection.processImage(inputImage);
      faceDetection.close();

      setState(() {
        faces = detectedFaces;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error detecting faces: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child:
                _image == null
                    ? const Icon(Icons.add_a_photo, size: 60)
                    : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(_image!, fit: BoxFit.cover),
                    ),
          ),
          SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              pickImage(ImageSource.camera);
            },
            text: 'Take the image',
          ),
          SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              pickImage(ImageSource.gallery);
            },
            text: 'Take the gallery',
          ),
          SizedBox(height: 20),
          Text(
            'Number of Person ${faces.length}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
