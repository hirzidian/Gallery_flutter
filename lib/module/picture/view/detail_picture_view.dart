import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/detail_picture_controller.dart';
import '../widget/detail_content_widget.dart';

class DetailPictureView extends StatelessWidget {
  final controller = Get.put(DetailPictureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Gambar')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return DetailContentWidget(
            imageUrl: controller.pictureDetail['download_url'],
            photographer: controller.pictureDetail['author'],
            id: controller.pictureDetail['id'],
          );
        }
      }),
    );
  }
}
