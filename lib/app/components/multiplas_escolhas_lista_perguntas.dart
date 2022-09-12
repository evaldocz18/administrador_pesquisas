import 'package:flutter/material.dart';
import 'package:vivo_help/app/model/multiplas_opcoes_model.dart';

import 'barra_navegacao_inferior.dart';

class MultiplasEscolhasListaPerguntas extends StatefulWidget {
  final PerguntasBinarias perguntasBinarias;

  const MultiplasEscolhasListaPerguntas({
    Key? key,
    required this.perguntasBinarias,
  }) : super(key: key);

  @override
  State<MultiplasEscolhasListaPerguntas> createState() =>
      _MultiplasEscolhasListaPerguntasState();
}

class _MultiplasEscolhasListaPerguntasState
    extends State<MultiplasEscolhasListaPerguntas> {
  bool caixaDeSelecao = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 10),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: Container(
        margin: const EdgeInsets.only(right: 20, top: 10),
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
        decoration: const BoxDecoration(
          color: Color(0xFFC4C4C4),
          borderRadius: BorderRadius.all(Radius.circular(55.0) //
              ),
        ),
        child: Row(children: [
          Transform.scale(
            scale: 2.0,
            child: Checkbox(
              checkColor: Colors.white,
              //fillColor: MaterialStateProperty.resolveWith(getColor),
              value: caixaDeSelecao,
              onChanged: (bool? value) {
                setState(() {
                  caixaDeSelecao = value!;
                  widget.perguntasBinarias.state = value;
                });
              },
            ),
          ),
          Expanded(
              child: Text(widget.perguntasBinarias.questao!,
                  style: const TextStyle(fontSize: 40))),
        ]),
      ),
    );
  }
}
