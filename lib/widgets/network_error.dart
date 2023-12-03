import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/wts.png',
          width: width,
          height: height,
        );
      },
    );
  }
}
