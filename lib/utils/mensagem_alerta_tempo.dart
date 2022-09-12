// // ignore_for_file: deprecated_member_use, unnecessary_new

// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../app/view/obrigado_animacao_screen.dart';

// class MensagemAlertaTempo {
//   static Timer? tempo;
//   static Timer? tempoBotao;
//   static int? contadorBotao;
//   static bool? repondeu;
//   static bool? dialogAtivo;

//   static void iniciarTempo(context) {
//     print('Dialog chamada');
//     tempo = Timer(const Duration(seconds: 3), () {
//       if (repondeu == false) {
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               // retorna um objeto do tipo Dialog
//               return AlertDialog(
//                 title: const Text("Alerta de inatividade"),
//                 content: const Text("Deseja continuar respondendo"),
//                 actions: <Widget>[
//                   // define os botões na base do dialogo
//                   new FlatButton(
//                     child: const Text("NÃO"),
//                     onPressed: () {
//                       repondeu = true;
//                       dialogAtivo = false;
//                       Navigator.of(context).pop();
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ObrigadoAnimacaoScreen()),
//                       );
//                     },
//                   ),
//                   new FlatButton(
//                     child: const Text("SIM"),
//                     onPressed: () {
//                       dialogAtivo = false;
//                       Navigator.of(context).pop();
//                       //cancelTime(context);
//                     },
//                   ),
//                 ],
//               );
//             });
//       }
//     });
//   }

//   static void iniciarTempoBotao(context) {
//     tempoBotao = Timer(const Duration(seconds: 3), () {
//       print('tempoBotao = ');
//       iniciarTempo(context);
//     });
//   }

//   static void cancelTime(context) {
//     tempo!.cancel();
//   }
// }
