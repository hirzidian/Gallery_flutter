import 'package:get/get.dart';
import 'package:gallery_ids/core.dart';

class ListPictureController extends GetxController {
  final isLoading = false.obs; // Untuk loading indicator
  final pictureList = <dynamic>[].obs; // RxList untuk menampung data

  final PictureService _pictureService = PictureService();
  int currentPage = 1;
  int limit = 10;

  @override
  void onInit() {
    super.onInit();
    fetchPictures(); // Memuat gambar saat halaman pertama kali dibuka
  }

  // Fungsi untuk memuat daftar gambar
  void fetchPictures() async {
    try {
      isLoading(true); // Aktifkan loading indicator
      var pictures = await _pictureService.fetchPictures(
        limit: limit,
        page: currentPage,
      );

      if (pictures.isNotEmpty) {
        if (currentPage == 1) {
          // Untuk halaman pertama, reset daftar
          pictureList.assignAll(pictures);
        } else {
          // Untuk halaman berikutnya, tambahkan ke daftar
          pictureList.addAll(pictures);
        }
      }

    } catch (e) {
      // Tampilkan error di snackbar
      Get.snackbar('Error', 'Failed to load pictures: $e');
    } finally {
      isLoading(false); // Matikan loading indicator
    }
  }


  // Fungsi untuk memuat lebih banyak gambar (pada saat menekan FAB)
  void loadMorePictures() {
    if (isLoading.value) return; // Jangan memuat lagi jika masih loading
      currentPage++;
      fetchPictures();
    }

}
