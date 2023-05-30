// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class android_addchat extends StatefulWidget {
  const android_addchat({super.key});

  @override
  State<StatefulWidget> createState() {
    return _android_addchat();
  }
}

class _android_addchat extends State<android_addchat> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: ThemeData(
            badgeTheme: const BadgeThemeData(
              backgroundColor: Color(0xff54759e),
            ),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xff54759e),
                  onSurface: Color(0xff54759e),
                )),
        child: Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index <= 1) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              isActive: getIsActive(0, _index),
              title: const Text('PROFILE PHOTO'),
              subtitle: const Text('Add Profile Photo'),
              content: Stack(children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: (Business.businessImage != null)
                      ? MemoryImage(Business.businessImage as Uint8List)
                      : null,
                  radius: 45,
                  child: TextButton(
                    onPressed: () async {
                      ImagePicker imagePiker = ImagePicker();
                      XFile? imageFile = await imagePiker.pickImage(
                          source: ImageSource.camera);

                      Business.businessImage = await imageFile!.readAsBytes();
                      setState(() {});
                    },
                    child: (Business.businessImage == null)
                        ? const Text(
                            "ADD",
                            style: TextStyle(color: Colors.white),
                          )
                        : Container(),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 0,
                  child: Container(
                    height: 25,
                    width: 25,
                    child: FloatingActionButton(
                      backgroundColor: Color(0xff54759e),
                      onPressed: () async {
                        ImagePicker imagePiker = ImagePicker();
                        XFile? imageFile = await imagePiker.pickImage(
                            source: ImageSource.camera);

                        Business.businessImage = await imageFile!.readAsBytes();
                        setState(() {});
                      },
                      child: (Business.businessImage == null)
                          ? const Icon(Icons.add)
                          : Container(),
                    ),
                  ),
                ),
              ]),
            ),
            new Step(
              isActive: getIsActive(0, _index),
              title: Text('Name'),
              subtitle: Text('Enter Name'),
              content: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Enter Your Name'),
              ),
            ),
            Step(
              isActive: getIsActive(0, _index),
              state: StepState.indexed,
              title: Text('Discription'),
              subtitle: Text('Enter Discription'),
              content: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Enter Your Discription'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool getIsActive(int currentIndex, int index) {
    if (currentIndex <= index) {
      return true;
    } else {
      return false;
    }
  }
}

class Business {
  static Uint8List? businessImage;
}
