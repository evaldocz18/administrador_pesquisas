// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:vivo_help/app/components/caixa_resposta_aberta.dart';

import '../../utils/instance.dart';
import '../components/animacao_avatar.dart';
import '../components/caixa_pergunta.dart';
import '../components/multiplas_escolhas_lista_perguntas.dart';
import '../components/barra_navegacao_inferior.dart';
import '../model/resposta_aberta_contato_model.dart';

class RespostaAbertContatoScreen extends StatefulWidget {
  final RespostaAbertaContato respostaAbertContato;

  const RespostaAbertContatoScreen(
      {Key? key, required this.respostaAbertContato})
      : super(key: key);

  @override
  State<RespostaAbertContatoScreen> createState() =>
      _RespostaAbertaContatoScreen();
}

class _RespostaAbertaContatoScreen extends State<RespostaAbertContatoScreen> {
  void salvarRespostas() {
    var id = widget.respostaAbertContato.id;

    ListaTelasGlobbal.infoJson!.removeWhere((element) => element["id"] == id);
    ListaTelasGlobbal.infoJson!.add(widget.respostaAbertContato.toJson());
    //print('InstanceTelas.infoJson = ' + InstanceTelas.infoJson.toString());
  }

  String verificarIdProximaTela() {
    String idProximatela = '';
    idProximatela =
        widget.respostaAbertContato.idProximaTelaEstatica.toString();

    return idProximatela;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*bottomNavigationBar: BotoesNavegacao(

          idProximaTela: "",
       ),*/
        body: SingleChildScrollView(
          child: Column(
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
                        pergunta: widget.respostaAbertContato.tituloQuestao,
                        //tamanhoLetra: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
              //RespostaAberta(),
              TextField(
                scrollPadding: const EdgeInsets.all(10.0),
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  labelText: 'Digite seu comentário',
                  contentPadding: EdgeInsets.symmetric(vertical: 30), //
                ),
                style: const TextStyle(fontSize: 40),
                maxLines: 50,
                minLines: 2,
                onChanged: (text) {
                  setState(() {
                    widget.respostaAbertContato.repostaAberta = text;
                  });
                }, //
              ),

              TextField(
                scrollPadding: const EdgeInsets.all(10.0),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Digite seu email',
                  contentPadding: EdgeInsets.symmetric(vertical: 30), //
                ),
                style: const TextStyle(fontSize: 40),
                maxLines: 1,
                minLines: 1,
                onChanged: (text) {
                  setState(() {
                    widget.respostaAbertContato.emailCliente = text;
                  });
                },
              ),
              TextField(
                scrollPadding: const EdgeInsets.all(10.0),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Digite seu telefone',
                  contentPadding: EdgeInsets.symmetric(vertical: 30), //
                ),
                style: const TextStyle(fontSize: 40),
                maxLines: 1,
                minLines: 1,
                onChanged: (text) {
                  setState(() {
                    widget.respostaAbertContato.telefoneCliente = text;
                  });
                },
              ),
              //Spacer(),
              BotoesNavegacao(
                salvar: salvarRespostas,
                idTelaAtual: widget.respostaAbertContato.id.toString(),
                idProximaTela: verificarIdProximaTela(),
                segundosSemInteracao: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
