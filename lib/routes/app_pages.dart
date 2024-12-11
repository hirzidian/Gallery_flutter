import 'package:get/get.dart';
import 'package:gallery_ids/core.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Paths.LIST_PICTURES,
      page: () => ListPictureView(),
      binding: PictureBinding(),
    ),
    GetPage(
      name: Paths.DETAIL_PICTURE,
      page: () => DetailPictureView(),
      binding: PictureBinding(),
    ),
  ];
}
