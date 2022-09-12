import 'package:flutter/material.dart';
import 'package:vivo_help/app/view/multiplas_3motions_screen.dart';
import 'package:vivo_help/app/view/multiplas_opcoes_screen.dart';
import 'package:vivo_help/app/view/obrigado_animacao_screen.dart';
import 'package:vivo_help/utils/instance.dart';
import 'package:vivo_help/app/model/nps_model.dart';
import 'package:vivo_help/app/view/nps_screen.dart';

import '../app/model/multiplas_opcoes_3emotions_model.dart';
import '../app/model/multiplas_opcoes_model.dart';
import '../app/model/resposta_aberta_contato_model.dart';
import '../app/view/resposta_aberta_contato_screen.dart';

class ChamarTela {
  static void proximaTela(String idTela, BuildContext context,
      {Function? acaoAoVoltarTela}) {
    if (idTela == "1") {
      var modelo = Nps.fromJson(_prourarId(idTela));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NpsScreen(
                  npsTela: modelo,
                )),
      ).then((value) {
        if (acaoAoVoltarTela != null) {
          acaoAoVoltarTela();
        }
      });
    }
    if (idTela == "2") {
      var modelo = MultiplasOpcoes.fromJson(_prourarId(idTela));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiplasOpcoesScreen(
                  multiplasOpcoes: modelo,
                )),
      ).then((value) {
        if (acaoAoVoltarTela != null) {
          acaoAoVoltarTela();
        }
      });
    }
    if (idTela == "3") {
      var modelo = MultiplasOpcoes3emotions.fromJson(_prourarId(idTela));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Multiplas3emotionsScreen(
                  multiplasOpcoes3emotions: modelo,
                )),
      ).then((value) {
        if (acaoAoVoltarTela != null) {
          acaoAoVoltarTela();
        }
      });
    }
    /*if (idTela == "4") {
       var modelo = RespostaAbertScreen.fromJson(_prourarId(idTela));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RespostaAbertScreen(
           respostaAberta: modelo,
        )),
      );
    }*/
    if (idTela == "5") {
      var modelo = RespostaAbertaContato.fromJson(_prourarId(idTela));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RespostaAbertContatoScreen(
                  respostaAbertContato: modelo,
                )),
      ).then((value) {
        if (acaoAoVoltarTela != null) {
          acaoAoVoltarTela();
        }
      });
    }
    if (idTela == "6") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ObrigadoAnimacaoScreen()),
      ).then((value) => acaoAoVoltarTela);
    }
  }
  // Navigator.of(context)
  //   .pushNamedAndRemoveUntil('/splash_screen', (Route<dynamic> route) => false);

  static Map<String, dynamic> _prourarId(String id) {
    Map<String, dynamic> object = {};
    List<dynamic> list = ListaTelasGlobbal.infoJson ?? [];

    for (var i = 0; i < list.length; i++) {
      if (list[i]["id"] == id) {
        object = list[i];
      }
    }

    return object;
  }
}
