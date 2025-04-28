import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/remote_storage/update_image_fire_store.dart';

class ImagePickerAndUpdate extends StatefulWidget {
  const ImagePickerAndUpdate({super.key, required this.imagePath});

  final String imagePath;

  @override
  State<ImagePickerAndUpdate> createState() => _ImagePickerAndUpdateState();
}

class _ImagePickerAndUpdateState extends State<ImagePickerAndUpdate> {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedImage;

  @override
  void initState() {
    super.initState();
    pickedImage = XFile(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          pickedImage = XFile(image.path);
          updateImage(FirebaseAuth.instance.currentUser!.uid, image.path);
        }

        setState(() {});
      },
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Image(
            width: 162,
            height: 162,
            image:
                pickedImage!.path.isEmpty
                    ? AssetImage(AssetsManeger.profileImage)
                    : FileImage(File(pickedImage!.path)),
          ),
        ),
      ),
    );
  }
}
