import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/data/models/notification_model.dart';
import 'package:travel_app/representations/widgets/app_bar_container.dart';

import '../../../../core/constants/dismesion_constant.dart';
import '../../../widgets/customize/button_widget.dart';
import '../../../widgets/forms/form_input_with _label.dart';
import 'notification_controller.dart';

class AddMessagePage extends StatefulWidget {
  const AddMessagePage({super.key});

  @override
  State<AddMessagePage> createState() => _AddMessagePageState();
}

class _AddMessagePageState extends State<AddMessagePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _toUserController = TextEditingController();
  File? _image;

  Future<void> _addNewMessage() async {
    notifications.add(NotificationModel(
        id: _generateNewId(),
        image: _image,
        code: "code",
        fromUser: "Me",
        toUser: _toUserController.text,
        title: _titleController.text,
        body: _bodyController.text,
        dateTime: DateTime.now(),
        seen: false));
    NotificationController.createNewNotification(
        title: _titleController.text,
        msg: _bodyController.text,
        channel: "alerts",
        username: _toUserController.text,
        heroThumbUrl:
            'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png');
    Navigator.of(context).pop(true);
  }

  // Function to open camera
  Future<void> _getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  // Function to open gallery
  Future<void> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image.path);
      setState(() {
        _image = File(image.path);
      });
    }
  }

  int _generateNewId() {
    if (notifications.isEmpty) {
      return 1; // Trường hợp danh sách rỗng, bắt đầu từ ID = 1
    } else {
      // Tìm ID lớn nhất trong danh sách và tăng lên 1
      int maxId = notifications
          .map((notification) => notification.id)
          .reduce((value, element) => value > element ? value : element);
      return maxId + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Tạo thông báo",
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kBottomBarIconSize * 3,
            ),
            LabelledFormInput(
                keyboardType: TextInputType.emailAddress,
                controller: _titleController,
                label: "Tiêu đề"),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            LabelledFormInput(
                keyboardType: TextInputType.emailAddress,
                controller: _bodyController,
                label: "Nội dung"),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            LabelledFormInput(
                keyboardType: TextInputType.emailAddress,
                controller: _toUserController,
                label: "Người nhận"),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _getImageFromCamera,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Chụp ảnh"),
                ),
                ElevatedButton.icon(
                  onPressed: _getImageFromGallery,
                  icon: const Icon(Icons.photo),
                  label: const Text("Chọn từ thư viện"),
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            // Display selected image if any
            _image != null
                ? Image.file(
                    _image!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            ButtonWidget(
              title: "Tạo thông báo",
              onTap: () {
                _addNewMessage();
              },
            )
          ],
        ),
      ),
    );
  }
}
