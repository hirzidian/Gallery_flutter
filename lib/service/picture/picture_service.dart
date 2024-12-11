import 'package:dio/dio.dart';

class PictureService {
  // Inisialisasi instance Dio
  final Dio _dio = Dio();

  // Fungsi untuk mengambil daftar foto dengan parameter `limit` dan `page`
  Future<List<dynamic>> fetchPictures({int limit = 10, int page = 1}) async {
    try {
      final response = await _dio.get(
        'https://picsum.photos/v2/list',
        queryParameters: {
          'limit': limit,
          'page': page,
        },
      );
      return response
          .data; // Dio secara otomatis mengkonversi JSON ke objek Dart
    } catch (e) {
      throw Exception('Failed to load pictures: $e');
    }
  }

  // Fungsi untuk mengambil detail foto berdasarkan id
  Future<Map<String, dynamic>> fetchPictureDetail(int id) async {
    try {
      final response = await _dio.get('https://picsum.photos/id/$id/info');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load picture detail: $e');
    }
  }
}
