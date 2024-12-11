import 'package:flutter/material.dart';

class DetailContentWidget extends StatelessWidget {
  final String imageUrl; // URL gambar
  final String photographer; // Nama fotografer
  final String id; // ID gambar

  const DetailContentWidget({
    Key? key,
    required this.imageUrl,
    required this.photographer,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gambar utama
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          // Informasi detail
          Text(
            "Photographer: $photographer",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "ID: $id",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
