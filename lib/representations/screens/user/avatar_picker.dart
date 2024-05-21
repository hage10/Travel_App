import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/constants/dismesion_constant.dart';

class AvatarPicker extends StatefulWidget {
  const AvatarPicker({super.key});
  @override
  _AvatarPickerState createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  File? _image;
  bool loadAvatar = false;
  Future<void> _pickImageSource(ImageSource source) async {
    final status = source == ImageSource.gallery
        ? await Permission.mediaLibrary.status
        : await Permission.camera.status;

    if (status.isDenied) {
      final result = source == ImageSource.gallery
          ? await Permission.mediaLibrary.request()
          : await Permission.camera.request();

      if (result.isGranted) {
        _pickImage(source);
      } else {
        return;
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    } else if (status.isGranted) {
      _pickImage(source);
    } else {
      return;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    loadAvatar = true;
    final pickedFile = await ImagePicker().pickImage(source: source);
    loadAvatar = false;
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _showImageSourceDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chọn nguồn ảnh'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Từ thư viện'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageSource(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Từ camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageSource(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _showImageSourceDialog();
          },
          child: Stack(
            children: [
              if (_image != null)
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white70, shape: BoxShape.circle),
                  child: loadAvatar
                      ? CircleAvatar(
                          backgroundImage: FileImage(_image!),
                          radius: 36,
                        )
                      : const SizedBox(
                          height: 36,
                          width: 36,
                          child: CircularProgressIndicator(),
                        ),
                )
              else
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white70, shape: BoxShape.circle),
                  child: const CircleAvatar(
                    radius: 36,
                    child: Icon(Icons.person),
                  ),
                ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: kDefaultIconSize,
                    weight: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
