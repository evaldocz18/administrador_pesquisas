// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:vivo_help/app/components/multiplas_escolhas_lista_3emotions.dart';

import '../../utils/instance.dart';
import '../components/animacao_avatar.dart';
import '../components/caixa_pergunta.dart';
import '../components/multiplas_escolhas_lista_perguntas.dart';
import '../components/barra_navegacao_inferior.dart';
import '../model/multiplas_opcoes_3emotions_model.dart';

class Multiplas3emotionsScreen extends StatefulWidget {
  final MultiplasOpcoes3emotions multiplasOpcoes3emotions;

  const Multiplas3emotionsScreen(
      {Key? key, required this.multiplasOpcoes3emotions})
      : super(key: key);

  @override
  State<Multiplas3emotionsScreen> createState() => _Multiplas3emotionsScreen();
}

class _Multiplas3emotionsScreen extends State<Multiplas3emotionsScreen> {
  @override
  Widget build(BuildContext context) {
    void salvarRespostas() {
      var id = widget.multiplasOpcoes3emotions.id;

      ListaTelasGlobbal.infoJson!.removeWhere((element) => element["id"] == id);
      ListaTelasGlobbal.infoJson!.add(widget.multiplasOpcoes3emotions.toJson());
      //print(InstanceTelas.infoJson);
    }

    String verificarIdProximaTela() {
      String idProximatela = '';
      List<Gabarito> listaGabarito =
          widget.multiplasOpcoes3emotions.gabarito ?? [];

      if (listaGabarito.length == 0) {
        idProximatela =
            widget.multiplasOpcoes3emotions.idProximaTelaEstatica.toString();
      } else {}
      return idProximatela;
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 300,
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: AnimationAvatar(),
                  ),
                  Expanded(
                    flex: 3,
                    child: CaixaPergunta(
                      pergunta: widget.multiplasOpcoes3emotions.tituloQuestao,
                      //tamanhoLetra: 100.0,
                    ),
                  ),
                ],
              ),
            ),
            ...widget.multiplasOpcoes3emotions.perguntas!
                .map(
                  (e) => MultiplasEscolhasLista3Emotion(perguntas3emotions: e),
                )
                .toList(),
            Spacer(),
            BotoesNavegacao(
              salvar: salvarRespostas,
              idTelaAtual: widget.multiplasOpcoes3emotions.id.toString(),
              idProximaTela: verificarIdProximaTela(),
              segundosSemInteracao: 60,
            ),
          ],
        ),
      ),
    );
  }
}
