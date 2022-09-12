// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import '../components/animacao_avatar.dart';
import '../components/caixa_pergunta.dart';
import '../components/liked_unliked_buttons.dart';
import '../components/barra_navegacao_inferior.dart';

class DitonicaSimNaoScreen extends StatefulWidget {
  const DitonicaSimNaoScreen({Key? key}) : super(key: key);

  @override
  State<DitonicaSimNaoScreen> createState() => _DitonicaSimNaoScreen();
}

class _DitonicaSimNaoScreen extends State<DitonicaSimNaoScreen> {
  @override
  Widget build(BuildContext context) {

    

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: AnimationAvatar(),
                  ),
                  Expanded(
                    flex: 2,
                    child: CaixaPergunta(
                      pergunta: 'Você comprou algum produto em nossa loja',
                      //tamanhoLetra: 100.0,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(55.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LikedUnlikedButton(),
                  ],
                ),
              ),
            ),
           /* BotoesNavegacao(
        
              idProximaTela: "",
            )*/
          ],
        ),
      ),
    );
  }
}
