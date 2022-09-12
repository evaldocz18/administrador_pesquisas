// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimationAvatar extends StatelessWidget {
  final tamanho;

  const AnimationAvatar({Key? key, this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/vivo-help.appspot.com/o/Vivo%20logo%20animado.gif?alt=media&token=7f538082-18b3-4359-b415-0c40d1244418",
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
