import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonImageWidget extends StatelessWidget {
  const CommonImageWidget({super.key, required this.image, this.width, this.height, this.fit = BoxFit.contain, this.color, this.borderRadius = 2});

  final String image;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Builder(
        builder: (context) {
          if (image.contains('.svg')) {
            return SvgPicture.asset(image, alignment: Alignment.center, width: width, height: height, fit: fit, color: color);
          } else if (image.contains('.png')) {
            return Image.asset(image, alignment: Alignment.center, width: width, height: height, fit: fit, color: color);
          } else if (image.contains('http')) {
            return CachedNetworkImage(
              imageUrl: image,
              alignment: Alignment.center,
              width: width,
              height: height,
              fit: fit,
              color: color,
              errorWidget: (context, url, error) {
                return Container(alignment: Alignment.center, color: Colors.grey.shade200);
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
