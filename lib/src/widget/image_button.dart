import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback? onTap;

  const ImageButton({Key? key, this.onTap, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 2.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: imageUrl == null
                ? const Icon(
                    Icons.camera_alt_outlined,
                    size: 40.0,
                    color: Colors.grey,
                  )
                : Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    width: 80.0,
                    height: 80.0,
                  ),
          ),
        ));
  }
}
