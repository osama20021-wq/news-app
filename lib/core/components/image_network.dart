import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({super.key, required this.urlImage});
  final String? urlImage;
  @override
  Widget build(BuildContext context) {
    return urlImage != null
        ? Image.network(
            urlImage!,
            width: 122,
            height: 68,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                width: 122,
                height: 68,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXTFH3NidfLUTCazwSaOSy-i8sSjSm7kDtrOK27KJVwBb2VMEok6mUryI&s=10",
              );
            },
          )
        : Image.network(
            width: 122,
            height: 68,
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXTFH3NidfLUTCazwSaOSy-i8sSjSm7kDtrOK27KJVwBb2VMEok6mUryI&s=10",
          );
  }
}
