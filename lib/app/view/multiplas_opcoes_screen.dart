// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, prefer_is_empty
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vivo_help/utils/mensagem_alerta_tempo.dart';
import '../../utils/chamar_tela.dart';
import '../../utils/instance.dart';
import '../components/animacao_avatar.dart';
import '../components/caixa_pergunta.dart';
import '../components/multiplas_escolhas_lista_perguntas.dart';
import '../components/barra_navegacao_inferior.dart';
import '../model/multiplas_opcoes_model.dart';
import 'package:simple_timer/simple_timer.dart';

class MultiplasOpcoesScreen extends StatefulWidget {
  final MultiplasOpcoes multiplasOpcoes;

  const MultiplasOpcoesScreen({Key? key, required this.multiplasOpcoes})
      : super(key: key);

  @override
  State<MultiplasOpcoesScreen> createState() => _MultiplasOpcoesScreenState();
}

class _MultiplasOpcoesScreenState extends State<MultiplasOpcoesScreen> {
  void salvarRespostas() {
    var id = widget.multiplasOpcoes.id;

    ListaTelasGlobbal.infoJson!.removeWhere((element) => element["id"] == id);
    ListaTelasGlobbal.infoJson!.add(widget.multiplasOpcoes.toJson());
    //print('InstanceTelas.infoJson = ' + InstanceTelas.infoJson.toString());
  }

  String verificarIdProximaTela() {
    String idProximatela = '';
    List<Gabarito> listaGabarito = widget.multiplasOpcoes.gabarito ?? [];

    if (listaGabarito.length == 0) {
      idProximatela = widget.multiplasOpcoes.idProximaTelaEstatica.toString();
    } else {}
    return idProximatela;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 300,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: AnimationAvatar(),
                  ),
                  Expanded(
                    flex: 3,
                    child: CaixaPergunta(
                      pergunta: widget.multiplasOpcoes.tituloQuestao,
                      //tamanhoLetra: 100.0,
                    ),
                  ),
                ],
              ),
            ),
            ...widget.multiplasOpcoes.perguntas!
                .map(
                  (e) => MultiplasEscolhasListaPerguntas(
                    perguntasBinarias: e,
                  ),
                )
                .toList(),
            Spacer(),
            BotoesNavegacao(
              salvar: salvarRespostas,
              idTelaAtual: widget.multiplasOpcoes.id.toString(),
              idProximaTela: verificarIdProximaTela(),
              segundosSemInteracao: 60,
            ),
          ],
        ),
      ),
    );
  }
}
