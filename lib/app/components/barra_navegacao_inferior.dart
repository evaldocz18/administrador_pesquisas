import 'package:flutter/material.dart';
import 'package:timer_controller/timer_controller.dart';
import 'package:vivo_help/app/splash_screen.dart';
import 'package:vivo_help/app/view/obrigado_animacao_screen.dart';

import '../../utils/chamar_tela.dart';

class BotoesNavegacao extends StatefulWidget {
  final String idProximaTela;
  final String idTelaAtual;
  final int segundosSemInteracao;
  final Function() salvar;
  const BotoesNavegacao({
    Key? key,
    required this.idProximaTela,
    required this.idTelaAtual,
    required this.salvar,
    required this.segundosSemInteracao,
  }) : super(key: key);

  @override
  State<BotoesNavegacao> createState() => _BotoesNavegacao();
}

class _BotoesNavegacao extends State<BotoesNavegacao> {
  TimerController? _controller;
  @override
  void initState() {
    _controller = TimerController.seconds(5);
    _controller!.start();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void pararTempo() {
    _controller!.pause();
    _controller!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 27),
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF135A83),
        borderRadius: BorderRadius.all(Radius.circular(55.0) //
            ),
      ),
      child: TimerControllerListener(
        controller: _controller!,
        listenWhen: (previousValue, currentValue) =>
            previousValue.status != currentValue.status,
        listener: (context, timerValue) {
          if (timerValue.remaining == 0) {
            MensagemAlertaInteracao.abrirJanela(_controller!, context);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(55.0)),
              ),
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFAD00FF)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Voltar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Container(
              width: 150,
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(55.0)),
              ),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      // ignore: prefer_const_constructors
                      MaterialStateProperty.all<Color>(Color(0xFFAD00FF)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Avançar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                onPressed: () {
                  widget.salvar();
                  pararTempo();
                  ChamarTela.proximaTela(widget.idProximaTela, context,
                      acaoAoVoltarTela: () {
                    _controller!.restart();
                  });
                },
              ),
            ),
          ],
        ),
        //)
      ),
    );
  }
}

class MensagemAlertaInteracao {
  static void abrirJanela(tempoTela, context) {
    Future.delayed(Duration(seconds: 555), () {
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => SplashScreen()));
    });
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alerta de inatividade"),
          content: const Text("Deseja continuar respondendo"),
          actions: <Widget>[
            // define os botões na base do dialogo
            FlatButton(
              child: const Text("NÃO"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ObrigadoAnimacaoScreen()),
                );
              },
            ),
            FlatButton(
              child: const Text("SIM"),
              onPressed: () {
                tempoTela!.restart();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
