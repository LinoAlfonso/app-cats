import 'package:flutter/material.dart';

class RenderImageNetwork extends StatelessWidget {
  final String imageUrl;
  final Size size;

  const RenderImageNetwork({super.key, required this.imageUrl, required this.size});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      height: size.height,
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[200],
          child: const Center(
            child: Icon(Icons.broken_image, size: 40),
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          height: size.height,
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

}