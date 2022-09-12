// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

class CaixaPergunta extends StatelessWidget {
  final pergunta;
  final altura;
  final largura;
  final tamanhoLetra;

  const CaixaPergunta({
    Key? key,
    required this.pergunta,
    this.tamanhoLetra,
    this.altura,
    this.largura,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tamanhoLetraLocal;
    if (tamanhoLetra == null) {
      tamanhoLetraLocal = 35.0;
    } else {
      tamanhoLetraLocal = tamanhoLetra;
    }
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.only(top: 50, bottom: 50, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFC4C4C4),
        borderRadius: BorderRadius.all(Radius.circular(55.0) //
            ),
      ),
      child: Text(pergunta, style: TextStyle(fontSize: tamanhoLetraLocal)),
    );
  }
}
