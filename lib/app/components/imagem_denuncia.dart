// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PrejudiceImage extends StatelessWidget {
  final tamanho;

  const PrejudiceImage({Key? key, this.tamanho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      //height: 200,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/vivo-help.appspot.com/o/denucie_qualquer_tipo_de_preconceito.png?alt=media&token=92b4fdb4-cba9-41a4-bf71-935852336ea8",
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
