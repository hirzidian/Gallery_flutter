import 'package:get/get.dart';
import 'package:gallery_ids/core.dart';

class DetailPictureController extends GetxController {
  final isLoading = true.obs;
  final pictureDetail = {}.obs;

  final PictureService _pictureService = PictureService();

  @override
  void onInit() {
    final id = Get.arguments; // Tangkap ID dari arguments
    fetchPictureDetail(id);
    super.onInit();
  }

  void fetchPictureDetail(int id) async {
    try {
      isLoading(true);
      var detail = await _pictureService.fetchPictureDetail(id);
      pictureDetail.value = detail;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
