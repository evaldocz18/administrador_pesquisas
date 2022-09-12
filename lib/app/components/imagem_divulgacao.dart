// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DivulgationImage extends StatelessWidget {
  final tamanho;

  const DivulgationImage({Key? key, this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/vivo-help.appspot.com/o/promocao_vivo.png?alt=media&token=4f51627c-dd28-4ec1-a75f-266ec3a78371",
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
