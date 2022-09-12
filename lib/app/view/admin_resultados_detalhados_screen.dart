// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminResultadosDetalhados extends StatefulWidget {
  const AdminResultadosDetalhados({Key? key}) : super(key: key);

  @override
  State<AdminResultadosDetalhados> createState() =>
      _AdminResultadosDetalhadosState();
}

class _AdminResultadosDetalhadosState extends State<AdminResultadosDetalhados> {
  final double tamanhoFonte = 20;
  final int resposta = 5;
  bool caixaDeSelecao = false;

  late final String respostaAbertaComentario =
      "Poderiam melhorar o estacionamento";
  late final String respostaAbertaEmail = "evaldo@gmail.com";
  late final String respostaAbertaTelefone = "";

  String imagemEmotionExcelente =
      "assets/imagens/3emotionsMonocromatic/emotion_excelente_monocromatico.png";
  String imagemEmotionRazoavel =
      "assets/imagens/3emotionsMonocromatic/emotion_razoavel_monocromatico.png";
  String imagemEmotionPessimo =
      "assets/imagens/3emotionsMonocromatic/emotion_pessimo_monocromatico.png";

  String imagemEmotionExcelenteCor =
      "assets/imagens/3emotionsColor/emotion_excelente_colorido.png";
  String imagemEmotionRazoavelCor =
      "assets/imagens/3emotionsColor/emotion_razoavel_colorido.png";

  String imagemEmotionPessimoCor =
      "assets/imagens/3emotionsColor/emotion_pessimo_colorido.png";

  double alturaEmotion = 40;
  double larguraEmotion = 40;

  List<Map<String, dynamic>> perguntas3emotions = [
    {
      'excelente': false,
      'questao': 'estrutura da loja',
      'razoavel': false,
      'ruim': true,
    },
    {
      'excelente': false,
      'questao': 'atendimento',
      'razoavel': true,
      'ruim': false,
    },
    {
      'excelente': true,
      'questao': 'preços loja',
      'razoavel': false,
      'ruim': false,
    },
  ];

  List<Map<String, dynamic>> perguntasList = [
    {
      'prioridadeResposta': false,
      'questao': 'Compra de plano',
      'state': true,
    },
    {
      'prioridadeResposta': false,
      'questao': 'Compra de intenet',
      'state': true,
    },
    {
      'prioridadeResposta': false,
      'questao': 'Apenas visita a loja',
      'state': false,
    },
    {
      'prioridadeResposta': false,
      'questao': 'Reclamar de algum plano ou produto',
      'state': false,
    },
    {
      'prioridadeResposta': false,
      'questao': 'Outros motivos',
      'state': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  '1 - NPS Pergunta',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, fontStyle: FontStyle.normal),
                ),
              ),
              SizedBox(
                //width: 750,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor: resposta == 0
                            ? Color(0xff2A80404)
                            : Colors.grey, //#A80404
                        primary: Colors.white,
                        //padding: const EdgeInsets.all(5.0),
                        // padding: const EdgeInsets.only(16.0),
                      ),
                      child: const Text('0'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor: resposta == 1
                            ? Color(0xff2A80404)
                            : Colors.grey, //#A80404
                        primary: Colors.white,
                        //padding: const EdgeInsets.all(5.0),
                        // padding: const EdgeInsets.only(16.0),
                      ),
                      child: const Text('1'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor:
                            resposta == 2 ? Color(0xff2A80404) : Colors.grey,
                        primary: Colors.white,
                      ),
                      child: const Text('2'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor:
                            resposta == 3 ? Color(0xff2A80404) : Colors.grey,
                        primary: Colors.white,
                      ),
                      child: const Text('3'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor:
                            resposta == 4 ? Color(0xff2A80404) : Colors.grey,
                        primary: Colors.white,
                      ),
                      child: const Text('4'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor:
                            resposta == 5 ? Color(0xff2A80404) : Colors.grey,
                        primary: Colors.white,
                      ),
                      child: const Text('5'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor:
                            resposta == 6 ? Color(0xff2A80404) : Colors.grey,
                        primary: Colors.white,
                      ),
                      child: const Text('6'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor:
                            resposta == 7 ? Color(0xff2A80404) : Colors.grey,
                        primary: Colors.white,
                      ),
                      child: const Text('7'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor:
                            resposta == 8 ? Color(0xff2A80404) : Colors.grey,
                        primary: Colors.white,
                      ),
                      child: const Text('8'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor:
                            resposta == 9 ? Color(0xff2A80404) : Colors.grey,
                        primary: Colors.white,
                      ),
                      child: const Text('9'),
                      onPressed: () {},
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: tamanhoFonte),
                        backgroundColor:
                            resposta == 10 ? Color(0xff2A80404) : Colors.grey,
                        primary: Colors.white,
                      ),
                      child: const Text('10'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Divider(
                height: 30,
                color: Colors.purpleAccent,
                thickness: 4,
                endIndent: 25,
                indent: 25,
              ),
              Text(
                '2 - Multiplas opções perguntas',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.normal),
              ),
              Column(
                children: perguntasList.map((element) {
                  return Container(
                    margin: const EdgeInsets.only(
                        right: 5, top: 5, left: 5, bottom: 5),
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 5, right: 5),
                    //margin: const EdgeInsets.only(right: 20, top: 10),
                    //padding: const EdgeInsets.only(
                    // top: 5, bottom: 5, left: 5, right: 5),
                    decoration: const BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      borderRadius: BorderRadius.all(Radius.circular(55.0) //
                          ),
                    ),
                    child: Row(children: [
                      Transform.scale(
                        scale: 1.0,
                        child: Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: element['state'],
                          onChanged: (bool? value) {
                            setState(() {
                              caixaDeSelecao = value!;
                              element['state'] = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                          child: Text(element['questao'],
                              style: const TextStyle(fontSize: 20))),
                    ]),
                  );
                }).toList(),
              ),
              Divider(
                height: 30,
                color: Colors.purpleAccent,
                thickness: 4,
                endIndent: 25,
                indent: 25,
              ),
              Text(
                '3 - Multiplas opções 3 emotions pergunta',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.normal),
              ),
              Column(
                children: perguntas3emotions.map((e) {
                  return Container(
                    margin: const EdgeInsets.only(
                        right: 5, top: 5, left: 5, bottom: 5),
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 5, right: 5),
                    decoration: const BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      borderRadius: BorderRadius.all(Radius.circular(55.0) //
                          ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            e['questao'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: e['excelente'] == true
                              ? Image.asset(imagemEmotionExcelenteCor,
                                  width: alturaEmotion, height: larguraEmotion)
                              : Image.asset(imagemEmotionExcelente,
                                  width: alturaEmotion, height: larguraEmotion),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: e['razoavel'] == true
                              ? Image.asset(imagemEmotionRazoavelCor,
                                  width: alturaEmotion, height: larguraEmotion)
                              : Image.asset(imagemEmotionRazoavel,
                                  width: alturaEmotion, height: larguraEmotion),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: e['ruim'] == true
                              ? Image.asset(imagemEmotionPessimoCor,
                                  width: alturaEmotion, height: larguraEmotion)
                              : Image.asset(imagemEmotionPessimo,
                                  width: alturaEmotion, height: larguraEmotion),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "  Não Avaliar",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              Divider(
                height: 30,
                color: Colors.purpleAccent,
                thickness: 4,
                endIndent: 25,
                indent: 25,
              ),
              // ignore: prefer_const_literals_to_create_immutables
              Text(
                '4 - Rerposta Aberta, email e telefone',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              ListTile(
                title: Text(
                  'Comentário do cliente',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Text(
                  respostaAbertaComentario == ''
                      ? 'Cliente não deixou telefone'
                      : respostaAbertaComentario,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: respostaAbertaComentario == ''
                        ? Colors.red
                        : Colors.green,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              ListTile(
                title: Text(
                  'Email',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Text(
                  respostaAbertaEmail == ''
                      ? 'Cliente não deixou telefone'
                      : respostaAbertaEmail,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:
                        respostaAbertaEmail == '' ? Colors.red : Colors.green,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              ListTile(
                title: Text(
                  'Telefone',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Text(
                  respostaAbertaTelefone == ''
                      ? 'Cliente não deixou telefone'
                      : respostaAbertaTelefone,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: respostaAbertaTelefone == ''
                        ? Colors.red
                        : Colors.green,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Divider(
                thickness: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
