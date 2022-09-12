// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vivo_help/app/components/imagem_divulgacao.dart';
import 'package:vivo_help/app/components/imagem_denuncia.dart';
import 'package:vivo_help/app/model/nps_model.dart';
import 'package:vivo_help/app/splash_screen.dart';
import '../../utils/chamar_tela.dart';
import '../../utils/instance.dart';
import '../components/animacao_avatar.dart';
import '../components/caixa_pergunta.dart';
import '../components/reportar_denuncia.dart';
import 'admin_screen.dart';
import 'package:http/http.dart' as http;

class NpsScreen extends StatefulWidget {
  final Nps npsTela;

  const NpsScreen({
    Key? key,
    required this.npsTela,
  }) : super(key: key);

  @override
  State<NpsScreen> createState() => _NpsScreen();
}

class _NpsScreen extends State<NpsScreen> {
  final double tamanhoFonte = 30;

  Uri urlUsuario =
      Uri.https("apifirabase-default-rtdb.firebaseio.com", "/usuarios.json");
  Map<String, dynamic> usuariosJson = {};
  late SharedPreferences _prefs;

  @override
  void initState() {
    buscarDadosUsuarios();
    super.initState();
  }

  void buscarDadosUsuarios() {
    http.get(urlUsuario).then((response) {
      usuariosJson = json.decode(response.body);
    });
  }

  Future<void> limpaShared() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }

  void buscarUsuario(Map<String, dynamic> usuariosJson, String login) {
    usuariosJson.forEach((key, value) {
      if (value['idUsuario'] == login) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return SplashScreen();
        }), (route) => false);
      }
    });
  }

  void apertou(String botaoId) {
    salvarResposta(botaoId);
    ChamarTela.proximaTela(verificarProximaTela(botaoId), context);
  }

  String verificarProximaTela(String botaoId) {
    String idProximatela = '';
    List<Gabarito> listaGabarito = widget.npsTela.gabarito ?? [];
    if (listaGabarito.isEmpty) {
      widget.npsTela.resposta = botaoId;
      idProximatela = widget.npsTela.idProximaTelaEstatica.toString();
    } else {
      for (var i = 0; i < listaGabarito.length; i++) {
        if (listaGabarito[i].resposta == botaoId) {
          widget.npsTela.resposta = botaoId;
          idProximatela = listaGabarito[i].idProximaTela!;
        }
      }
    }
    return idProximatela;
  }

  void salvarResposta(String resposta) {
    var id = widget.npsTela.id;
    var data = (DateTime.now().toString());

    Map<String, dynamic> object = {};
    List<dynamic> list = ListaTelasGlobbal.infoJson ?? [];

    for (var i = 0; i < list.length; i++) {
      if (list[i]["id"] == id) {
        object = list[i];
      }
    }

    object['resposta'] = resposta;
    object['data'] = data;

    for (var i = 0; i < list.length; i++) {
      if (list[i]["id"] == id) {
        list[i] = object;
      }
    }
    print('Responsta NPS = ' + object['resposta']);
    ListaTelasGlobbal.infoJson = list;
  }

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //TempoAusenciaInteracao.iniciarTempo(context);
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.grey,
        body: Column(
          children: [
            SizedBox(
              height: 300,
              child: Row(
                children: [
                  Expanded(
                    child: AnimationAvatar(),
                  ),
                  Expanded(
                    flex: 2,
                    child: CaixaPergunta(
                      pergunta: widget.npsTela.tituloQuestao,
                      //tamanhoLetra: 100.0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  botaoNpds(corBotao: Color(0xff2A80404), idBotao: '0'),
                  botaoNpds(corBotao: Color(0xffE10505), idBotao: '1'),
                  botaoNpds(corBotao: Color(0xffFD4128), idBotao: '2'),
                  botaoNpds(corBotao: Color(0xffFD7528), idBotao: '3'),
                  botaoNpds(corBotao: Color(0xffFDA128), idBotao: '4'),
                  botaoNpds(corBotao: Color(0xffFCDB28), idBotao: '5'),
                  botaoNpds(corBotao: Color(0xffE7F85B), idBotao: '6'),
                  botaoNpds(corBotao: Color(0xffCEF853), idBotao: '7'),
                  botaoNpds(corBotao: Color(0xff9AD84A), idBotao: '8'),
                  botaoNpds(corBotao: Color(0xff66D84A), idBotao: '9'),
                  botaoNpds(corBotao: Color(0xff66D84A), idBotao: '10'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(
                    'Pouco Provável',
                    style: TextStyle(
                        color: Color(0xff2A80404),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Muito Provável',
                    style: TextStyle(
                        color: Color(0xff2FAF10),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 75,
            // ),
            /*SizedBox(
              //width: 750,
              //height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonsNps(),
                ],
              ),
            ),*/
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DivulgationImage(),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 1,
                    child: PrejudiceImage(),
                  ),
                  Flexible(
                    flex: 1,
                    child: ButtonReportPrejudice(),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              height: 35,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.lock_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                                "ATENÇÃO OPÇÃO APENAS PARA ADMINISTRADOR"),
                            content: TextField(
                              controller: _textEditingController,
                              scrollPadding: const EdgeInsets.all(10.0),
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                labelText: 'Digite o token',
                              ),
                              style: const TextStyle(fontSize: 20),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: const Text("NÃO"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: const Text("SIM"),
                                onPressed: () {
                                  limpaShared();
                                  buscarUsuario(usuariosJson,
                                      _textEditingController.text);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget botaoNpds({required Color corBotao, required String idBotao}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          apertou(idBotao);
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            height: constraints.maxWidth * 1.4,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: corBotao,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              idBotao,
              style: TextStyle(
                  fontSize: constraints.maxWidth / 1.6, color: Colors.white),
            ),
          );
        }),
      ),
    );
  }
}
