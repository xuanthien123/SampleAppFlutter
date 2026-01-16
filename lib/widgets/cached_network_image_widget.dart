import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../res.dart';
import '../theme/colors.dart';
import '../utils/file_ultil.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  double width;
  double height;
  String? imageUrl;
  dynamic widget;
  CachedNetworkImageWidget(
      {Key? key, required this.width, required this.height, this.imageUrl, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.cover,
      imageUrl: checkDomainImage(imageUrl ?? ""),
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) => Container(
        padding: EdgeInsets.all(10),
        color: AppColors.grey,
        child: Icon(Icons.person),
      ),
      placeholder: (context, url) => SizedBox(),
    );
  }
}
