// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vivo_help/app/view/login_terminal_screen.dart';

import '../utils/chamar_tela.dart';
import '../utils/instance.dart';
import 'model/usuario_model.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  setFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  //Usuario _usuario = Usuario();
  late SharedPreferences _prefs;
  List<String> listStrings = <String>["Nenhum registro carregado."];

  Uri urlUsuario =
      Uri.https("apifirabase-default-rtdb.firebaseio.com", "/usuarios.json");
  Map<String, dynamic> usuariosJson = {};

  String? questionario;
  bool mensagemErro = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textController = TextEditingController();

  List<dynamic> listaQuestionarios = [];

  @override
  void initState() {
    buscarDadosUsuarios();
    _buscarQuestionarioLocal();
    setFullScreen();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _buscarQuestionarioLocal() async {
    _prefs = await SharedPreferences.getInstance();
    questionario = _prefs.getString('questionario');
    if (questionario == null) {
      buscarQuestionario(name: NomeQuestionarioGlobal.name!);
      //NomeQuestionarioGlobal.name = questionario;
    }
    if (questionario != null) {
      buscarQuestionario(name: questionario!);
    }
  }

  void buscarDadosUsuarios() {
    http.get(urlUsuario).then((response) {
      usuariosJson = json.decode(response.body);
    });
  }

  void buscarUsuario(Map<String, dynamic> usuariosJson, String login) {
    usuariosJson.forEach((key, value) {
      if (value['idUsuario'] == login) {
        setState(() {
          listaQuestionarios = value['questionarios'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminal de Pesquisa'),
      ),
      body: NomeQuestionarioGlobal.name != null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: questionario == null
                          ? Center(
                              child: Text(
                                "Por favor efetue o login novamente",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20, fontStyle: FontStyle.normal),
                              ),
                            )
                          : Text(
                              "Nome da Empresa: " +

                                  UsuarioGlobal.usuario.nomeEmpresa.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.normal),
                            ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: listaQuestionarios.isEmpty
                          ? () {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginTerminalScreen();
                              }), (route) => false);
                            }
                          : null,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Ir para página de login',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Visibility(
                      visible: listaQuestionarios.isNotEmpty,
                      child: Column(
                        children: [
                          Text(
                            'Selecione o questionario:',
                            style: TextStyle(fontSize: 24),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: listaQuestionarios.map((e) {
                              return Container(
                                margin: EdgeInsets.all(16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Uri urlQuestionarios = Uri.https(
                                        "apifirabase-default-rtdb.firebaseio.com",
                                        "/$e.json");
                                    NomeQuestionarioGlobal.name = e;
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SplashScreen();
                                    }), (route) => false);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFC4C4C4),
                                    ),
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void buscarQuestionario({required String name}) {
    http
        .get(
            Uri.https("apifirabase-default-rtdb.firebaseio.com", "/$name.json"))
        .then((response) {
      Map<String, dynamic> questionariosJson = {};
      List<dynamic> tela = [];
      questionariosJson = json.decode(response.body);
      //InstanceTelas.infoJson = json.decode(response.body);
      questionariosJson.forEach((key, value) {
        value.map((e) {
          tela.add(e);
        }).toList();
      });
      ListaTelasGlobbal.infoJson = tela.toList();
      ChamarTela.proximaTela(ListaTelasGlobbal.infoJson?[0]["id"], context);
    });
  }
}
