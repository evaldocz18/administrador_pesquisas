// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:vivo_help/app/splash_screen.dart';
import 'package:vivo_help/utils/instance.dart';

import '../model/usuario_model.dart';

class LoginTerminalScreen extends StatefulWidget {
  LoginTerminalScreen({Key? key}) : super(key: key);

  @override
  State<LoginTerminalScreen> createState() => _LoginTerminalScreenState();
}

class _LoginTerminalScreenState extends State<LoginTerminalScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textController = TextEditingController();

  bool mensagemErro = false;
  late SharedPreferences _prefs;
  List<dynamic> listaQuestionarios = [];

  Uri urlUsuario =
      Uri.https("apifirabase-default-rtdb.firebaseio.com", "/usuarios.json");
  Map<String, dynamic> usuariosJson = {};

  void buscarDadosUsuarioAPI() {
    http.get(urlUsuario).then((response) {
      usuariosJson = json.decode(response.body);
    });
    // Se der erro carregar o usuario local
  }

  @override
  void initState() {
    buscarDadosUsuarioAPI();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terminal de Pesquisa'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Logout',
          onPressed: () {
            NomeQuestionarioGlobal.name = null;
            Navigator.pushNamedAndRemoveUntil(
                context, '/login_terminal_screen', (route) => false);
          },
        ),
      ]),
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
                      child: UsuarioGlobal.usuario.nomeEmpresa == null
                          ? Center(
                              child: Text(
                                "Efetue o Login para exibir seus questionários",
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
                    TextFormField(
                      controller: _textController,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Senha invalida !';
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Login',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Visibility(
                      visible: mensagemErro,
                      child: const Text(
                        'Login incorreto ou não cadastrado !',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: listaQuestionarios.isEmpty
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                buscarUsuarioAPI(
                                    usuariosJson, _textController.text);
                              }
                            }
                          : null,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Entrar',
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

  void buscarUsuarioAPI(Map<String, dynamic> usuariosJson, String login) {
    usuariosJson.forEach((key, value) {
      if (value['idUsuario'] == login) {
        setState(() {
          listaQuestionarios = value['questionarios'];
          UsuarioGlobal.usuario.idUsuario = value['idUsuario'];
          UsuarioGlobal.usuario.nomeEmpresa = value['nomeEmpresa'];
          UsuarioGlobal.usuario.usuarioAtivo = value['usuarioAtivo'];
        });
      }
    });
    UsuarioGlobal.usuario;
    salvarUsuarioLocal();
  }

  Future<void> salvarUsuarioLocal() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('usuario', UsuarioGlobal.usuario.idUsuario!);
    print('Usuario local = ' + _prefs.getString('usuario').toString());
  }

  Future<void> _buscarUsuarioLocal() async {
    _prefs = await SharedPreferences.getInstance();
    UsuarioGlobal.usuario = _prefs.getString('usuario').toString() as Usuario;
  }
}
