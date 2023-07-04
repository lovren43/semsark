import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:semsark/provider/verify_user_provider.dart';

class VerifyUserScreen extends StatelessWidget {
  final picker = ImagePicker();
  PickedFile? _image;

  Future<void> _takePhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {

    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    var provider = Provider.of<VerifyUserProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          if (_image != null)
            Positioned.fill(
              child: Image.file(
                File(_image!.path),
                fit: BoxFit.cover,
              ),
            ),
          Column(
            children: [
              SizedBox(height: height*0.1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    height: height * 0.3,
                    width: width*0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Pick a photo for yourself',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          color: Colors.black,
                          iconSize: 80.0,
                          onPressed: _takePhoto,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height*0.1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    height: height * 0.3,
                    width: width*0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Pick a photo for your National ID',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          color: Colors.black,
                          iconSize: 80.0,
                          onPressed: _takePhoto,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
