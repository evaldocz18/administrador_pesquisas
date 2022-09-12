// ignore_for_file: avoid_print, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:vivo_help/app/model/multiplas_opcoes_3emotions_model.dart';

class MultiplasEscolhasLista3Emotion extends StatefulWidget {
  final PerguntasEmotions perguntas3emotions;
  const MultiplasEscolhasLista3Emotion(
      {Key? key, required this.perguntas3emotions})
      : super(key: key);

  @override
  State<MultiplasEscolhasLista3Emotion> createState() =>
      _MultiplasEscolhasLista3Emotion();
}

class _MultiplasEscolhasLista3Emotion
    extends State<MultiplasEscolhasLista3Emotion> {
  String imagemEmotionExcelente =
      "assets/imagens/3emotionsMonocromatic/emotion_excelente_monocromatico.png";
  String imagemEmotionRazoavel =
      "assets/imagens/3emotionsMonocromatic/emotion_razoavel_monocromatico.png";
  String imagemEmotionPessimo =
      "assets/imagens/3emotionsMonocromatic/emotion_pessimo_monocromatico.png";

  void mudarCorEmotionExcelente() {
    if (imagemEmotionExcelente ==
        "assets/imagens/3emotionsMonocromatic/emotion_excelente_monocromatico.png") {
      imagemEmotionExcelente =
          "assets/imagens/3emotionsColor/emotion_excelente_colorido.png";
      imagemEmotionRazoavel =
          "assets/imagens/3emotionsMonocromatic/emotion_razoavel_monocromatico.png";
      imagemEmotionPessimo =
          "assets/imagens/3emotionsMonocromatic/emotion_pessimo_monocromatico.png";
    } else {
      imagemEmotionExcelente =
          "assets/imagens/3emotionsMonocromatic/emotion_excelente_monocromatico.png";
    }
    setState(() {});
  }

  void mudarCorEmotionRazoavel() {
    if (imagemEmotionRazoavel ==
        "assets/imagens/3emotionsMonocromatic/emotion_razoavel_monocromatico.png") {
      imagemEmotionRazoavel =
          "assets/imagens/3emotionsColor/emotion_razoavel_colorido.png";

      imagemEmotionExcelente =
          "assets/imagens/3emotionsMonocromatic/emotion_excelente_monocromatico.png";
      imagemEmotionPessimo =
          "assets/imagens/3emotionsMonocromatic/emotion_pessimo_monocromatico.png";
    } else {
      imagemEmotionRazoavel =
          "assets/imagens/3emotionsMonocromatic/emotion_razoavel_monocromatico.png";
    }
    setState(() {});
  }

  void mudarCorEmotionPessimo() {
    if (imagemEmotionPessimo ==
        "assets/imagens/3emotionsMonocromatic/emotion_pessimo_monocromatico.png") {
      imagemEmotionPessimo =
          "assets/imagens/3emotionsColor/emotion_pessimo_colorido.png";
      imagemEmotionExcelente =
          "assets/imagens/3emotionsMonocromatic/emotion_excelente_monocromatico.png";
      imagemEmotionRazoavel =
          "assets/imagens/3emotionsMonocromatic/emotion_razoavel_monocromatico.png";
    } else {
      imagemEmotionPessimo =
          "assets/imagens/3emotionsMonocromatic/emotion_pessimo_monocromatico.png";
    }
    setState(() {});
  }

  bool naoAvaliar = false;
  @override
  Widget build(BuildContext context) {
    double alturaEmotion = 80;
    double larguraEmotion = 80;

    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        top: 10,
        left: 20,
      ),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      decoration: const BoxDecoration(
        color: Color(0xFFC4C4C4),
        borderRadius: BorderRadius.all(Radius.circular(55.0) //
            ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.perguntas3emotions.questao!,
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              mudarCorEmotionExcelente();
              widget.perguntas3emotions.excelente = true;
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(imagemEmotionExcelente,
                  width: alturaEmotion, height: larguraEmotion),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              mudarCorEmotionRazoavel();
              widget.perguntas3emotions.razoavel = true;
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(imagemEmotionRazoavel,
                  width: alturaEmotion, height: larguraEmotion),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              mudarCorEmotionPessimo();
              widget.perguntas3emotions.pessimo = true;
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(imagemEmotionPessimo,
                  width: alturaEmotion, height: larguraEmotion),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          /*TextButton(
            onPressed: () {
              setState(() {
                naoAvaliar = !naoAvaliar;

                //print(DateTime.now());
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: naoAvaliar
                    ? Border.all(color: Colors.green, width: 8)
                    : Border.all(color: Colors.transparent, width: 8),
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "  Não\nAvaliar",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
