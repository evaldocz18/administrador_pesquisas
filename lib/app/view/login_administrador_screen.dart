// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vivo_help/app/model/usuario_model.dart';
import 'package:vivo_help/app/view/admin_resultados_quantitativos.dart';
import 'package:vivo_help/utils/instance.dart';

class LoginAdministradorScreen extends StatefulWidget {
  LoginAdministradorScreen({Key? key}) : super(key: key);

  @override
  State<LoginAdministradorScreen> createState() =>
      _LoginAdministradorScreenState();
}

class _LoginAdministradorScreenState extends State<LoginAdministradorScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textController = TextEditingController();

  bool mensagemErro = false;

  Usuario _usuario = Usuario();
  List<dynamic> listaQuestionarios = [];

  Uri urlUsuario =
      Uri.https("apifirabase-default-rtdb.firebaseio.com", "/usuarios.json");
  Map<String, dynamic> usuariosJson = {};

  void buscarDados() {
    http.get(urlUsuario).then((response) {
      usuariosJson = json.decode(response.body);
    });
  }

  @override
  void initState() {
    buscarDados();
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
      appBar: AppBar(
          title: const Text('Administrador Terminal de Pesquisa'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                NomeQuestionarioGlobal.name = null;
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login_administrador_screen', (route) => false);
              },
            ),
          ]),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                          buscarUsuario(usuariosJson, _textController.text);
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
                      'Selecione o questionario',
                      style: TextStyle(fontSize: 24),
                    ),
                    Column(
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
                                return AdminResultadosQuantitativos(
                                  urlQuestionarios: urlQuestionarios,
                                );
                              }), (route) => false);
                            },
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 24),
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

  void buscarUsuario(Map<String, dynamic> usuariosJson, String login) {
    usuariosJson.forEach((key, value) {
      if (value['idUsuario'] == login) {
        print(value['questionarios']);
        setState(() {
          listaQuestionarios = value['questionarios'];
        });
      }
    });
  }
}
