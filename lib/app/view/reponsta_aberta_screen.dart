// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:vivo_help/app/components/caixa_resposta_aberta.dart';

import '../../utils/instance.dart';
import '../components/animacao_avatar.dart';
import '../components/caixa_pergunta.dart';
import '../components/multiplas_escolhas_lista_perguntas.dart';
import '../components/barra_navegacao_inferior.dart';

class RespostaAbertScreen extends StatefulWidget {
  final RespostaAberta respostaAberta;

  const RespostaAbertScreen({Key? key, required this.respostaAberta}) : super(key: key);

  @override
  State<RespostaAbertScreen> createState() => _RespostaAbertScreen();
}

class _RespostaAbertScreen extends State<RespostaAbertScreen> {

   /*void salvarRespostas() {
    var id = widget.respostaAberta.id;

    InstanceTelas.infoJson!.removeWhere((element) => element["id"] == id);
    InstanceTelas.infoJson!.add(widget.respostaAberta.toJson());
    //print('InstanceTelas.infoJson = ' + InstanceTelas.infoJson.toString());
  }*/
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
                      pergunta:
                          'Deixe seu comentário para que possámos analisar o seu problema.',
                      //tamanhoLetra: 100.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RespostaAberta(),
            ),
             /*BotoesNavegacao(
              salvar: salvarRespostas,
              idTelaAtual: widget.multiplasOpcoes.id.toString(),
              idProximaTela: verificarIdProximaTela(),
            ),*/
          ],
        ),
      ),
    );
  }
}
