// ignore_for_file: unused_import, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:vivo_help/app/splash_screen.dart';
import 'package:vivo_help/app/model/nps_model.dart';
import 'package:vivo_help/app/view/admin_resultados_detalhados_screen.dart';
import 'package:vivo_help/app/view/admin_resultados_quantitativos.dart';
import 'package:vivo_help/app/view/ditonica_sim_nao_screen.dart';
import 'package:vivo_help/app/view/login_administrador_screen.dart';
import 'package:vivo_help/app/view/login_terminal_screen.dart';
import 'package:vivo_help/app/view/multiplas_opcoes_screen.dart';
import 'package:vivo_help/app/view/nps_screen.dart';
import 'package:vivo_help/app/view/obrigado_animacao_screen.dart';
import 'package:vivo_help/app/view/reponsta_aberta_screen.dart';
import 'app/view/multiplas_3motions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uri urlQuestionario = Uri.https("apifirabase-default-rtdb.firebaseio.com",
        "/Questionário totem entrada.json");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vivo Help',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/admin_resultados_quantitativos',
        // initialRoute: '/splash_screen',
        routes: {
          '/splash_screen': (context) => SplashScreen(),
          '/admin_resultados_detalhados': (context) =>
              AdminResultadosDetalhados(),
          '/admin_resultados_quantitativos': (context) =>
              AdminResultadosQuantitativos(
                urlQuestionarios: urlQuestionario,
              ),
          '/ditonica_sim_nao': (context) => DitonicaSimNaoScreen(),
          '/login_terminal_screen': (context) => LoginTerminalScreen(),
          '/login_administrador_screen': (context) =>
              LoginAdministradorScreen(),
          //'/multiplas_opcoes': (context) => MultiplasOpcoesScreen(),
          //'/multiplas_3emotion': (context) => Multiplas3emotionsScreen(),
          //'/resposta_aberta': (context) => RespostaAbertScreen(),
          '/obrigado': (context) => ObrigadoAnimacaoScreen(),
        });
  }
}
