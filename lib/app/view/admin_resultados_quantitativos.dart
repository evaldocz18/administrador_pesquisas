// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vivo_help/app/model/resposta_aberta_contato_model.dart';
import 'package:vivo_help/utils/instance.dart';
import '../model/multiplas_opcoes_3emotions_model.dart';
import '../model/multiplas_opcoes_model.dart';
import '../model/nps_model.dart';

class AdminResultadosQuantitativos extends StatefulWidget {
  AdminResultadosQuantitativos({Key? key, required this.urlQuestionarios})
      : super(key: key);

  final Uri urlQuestionarios;

  @override
  State<AdminResultadosQuantitativos> createState() =>
      _AdminResultadosQuantitativosState();
}

class _AdminResultadosQuantitativosState
    extends State<AdminResultadosQuantitativos> {
  final int resposta = 5;
  bool caixaDeSelecao = false;

  Map<String, dynamic> respostasJson = {};
  List<dynamic> respostas = [];
  //late ResultadoQtd3Emotions resultadoQtd3Emotion;

  late Nps perguntaNps = Nps();
  late MultiplasOpcoes perguntasMultiplasOpcoes = MultiplasOpcoes();
  late MultiplasOpcoes3emotions perguntasMultiplasOpcoes3emotions =
      MultiplasOpcoes3emotions();
  late RespostaAbertaContato perguntaRespostaAbertaContato =
      RespostaAbertaContato();

  late List<Nps> respostasNps = [];
  late List<MultiplasOpcoes> respostasMultiplasOpcoes = [];
  late List<PerguntasBinarias> perguntasBinarias = [];
  late List<MultiplasOpcoes3emotions> respostasMultiplasOpcoes3emotions = [];
  late List<RespostaAbertaContato> respostasRespostaAbertaContato = [];

  void buscarDados() async {
    //Carrega o questionário que o administrador selecionou
    await http.get(widget.urlQuestionarios).then((response) {
      Map<String, dynamic> questionarioJson = {};
      //Aqui deve ser feita a busca pelo questionário que o administrador escolheu
      questionarioJson = json.decode(response.body);
      salvarPerguntasQuestionario(questionarioJson);
    });

    //Carregando listas dos resultados
    await http.get(urlRespostas).then((response) {
      Map<String, dynamic> respostasJson = {};
      //Aqui busca todas as respostas viculadas ao questionario selecionado
      respostasJson = json.decode(response.body);
      salvarListaRespostas(respostasJson);

      //Calcula indivudualmente cada tipo de pergunta e atualiza a tela
      calcularRespostasNPS();
      calcularRespostasMultiplasOpcoes();
      calcularRespostasMultiplas3Emotions();
      calcularRespostasAbertasContatos();
      carregarRespostasAbertasEContatos();
    });
  }

  @override
  void initState() {
    buscarDados();
    super.initState();
  }

  Map<String, dynamic> resultadosNPS = {
    'tituloQuestao': '1 - Carregando...',
    'nps0': 0,
    'nps1': 0,
    'nps2': 0,
    'nps3': 0,
    'nps4': 0,
    'nps5': 0,
    'nps6': 0,
    'nps7': 0,
    'nps8': 0,
    'nps9': 0,
    'nps10': 0
  };
  List<Map<String, dynamic>> resultadosPerguntasOpcoes = [];
  List<Map<String, dynamic>> resultados3emotion = [];
  Map<String, dynamic> resultadosAbertasContatos = {
    'qtdTelefone': 0,
    'qtdEmail': 0,
    'qtdRespostaAberta': 0,
    'qtdNome': 0
  };
  List<Map<String, dynamic>> respostasDetalhadasAbertasContatos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Administrador Terminal de Pesquisa'),
          actions: <Widget>[
            // IconButton(
            //   icon: const Icon(Icons.picture_as_pdf),
            //   tooltip: 'Administrador Terminal de Pesquisa',
            //   onPressed: () {
            //     ScaffoldMessenger.of(context)
            //         .showSnackBar(const SnackBar(content: Text('Criando PDF')));
            //   },
            // ),
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                NomeQuestionarioGlobal.name = null;
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login_administrador_screen', (route) => false);
              },
            ),
            IconButton(
              icon: const Icon(Icons.update),
              tooltip: 'Administrador Terminal de Pesquisa',
              onPressed: () {
                limparVariaveis();
                buscarDados();
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Atualizando Resultados...')));
              },
            ),
          ]),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
//------------------------------------NPS-------------------------------------------------------
                child: perguntaNps.tituloQuestao == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        "1- " + perguntaNps.tituloQuestao!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.normal),
                      ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                //width: 750,
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    construirNps(
                        valor: '0',
                        quantidade: resultadosNPS['nps0'].toString(),
                        selecionado: resposta == 0),
                    construirNps(
                        valor: '1',
                        quantidade: resultadosNPS['nps1'].toString(),
                        selecionado: resposta == 1),
                    construirNps(
                        valor: '2',
                        quantidade: resultadosNPS['nps2'].toString(),
                        selecionado: resposta == 2),
                    construirNps(
                        valor: '3',
                        quantidade: resultadosNPS['nps3'].toString(),
                        selecionado: resposta == 3),
                    construirNps(
                        valor: '4',
                        quantidade: resultadosNPS['nps4'].toString(),
                        selecionado: resposta == 4),
                    construirNps(
                        valor: '5',
                        quantidade: resultadosNPS['nps5'].toString(),
                        selecionado: resposta == 5),
                    construirNps(
                        valor: '6',
                        quantidade: resultadosNPS['nps6'].toString(),
                        selecionado: resposta == 6),
                    construirNps(
                        valor: '7',
                        quantidade: resultadosNPS['nps7'].toString(),
                        selecionado: resposta == 7),
                    construirNps(
                        valor: '8',
                        quantidade: resultadosNPS['nps8'].toString(),
                        selecionado: resposta == 8),
                    construirNps(
                        valor: '9',
                        quantidade: resultadosNPS['nps9'].toString(),
                        selecionado: resposta == 9),
                    construirNps(
                        valor: '10',
                        quantidade: resultadosNPS['nps10'].toString(),
                        selecionado: resposta == 10),
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
//-------------------------------Multiplas Opções----------------------------------------------------------
              perguntasMultiplasOpcoes.tituloQuestao == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text(
                      "2- " + perguntasMultiplasOpcoes.tituloQuestao!,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                    ),
              Column(
                children: resultadosPerguntasOpcoes.map((element) {
                  return Container(
                    margin: const EdgeInsets.only(
                        right: 5, top: 5, left: 5, bottom: 5),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      borderRadius: BorderRadius.all(Radius.circular(55.0) //
                          ),
                    ),
                    child: resultadosPerguntasOpcoes.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Row(children: [
                            Expanded(
                                child: Text(element['questao'],
                                    style: const TextStyle(fontSize: 20))),
                            Text(
                              element['qtdRespostas'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700),
                            ),
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
//----------------------------Multiplas Opcoes 3 emotions-------------------------------------------------------
              perguntasMultiplasOpcoes3emotions.tituloQuestao == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text(
                      "3- " + perguntasMultiplasOpcoes3emotions.tituloQuestao!,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                    ),
              Column(
                children: resultados3emotion.map((element) {
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
                            element['questao'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(imagemEmotionExcelenteCor,
                                    width: alturaEmotion,
                                    height: larguraEmotion)),
                            Text(
                              element['qtdExcelente'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(imagemEmotionRazoavelCor,
                                    width: alturaEmotion,
                                    height: larguraEmotion)),
                            Text(
                              element['qtdRazoavel'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(imagemEmotionPessimoCor,
                                    width: alturaEmotion,
                                    height: larguraEmotion)),
                            Text(
                              element['qtdPessimo'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
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
//----------------------------Rerposta Aberta, email e telefone-----------------------------------
              perguntaRespostaAbertaContato.tituloQuestao == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text(
                      "4- " + perguntaRespostaAbertaContato.tituloQuestao!,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                    ),
              ListTile(
                title: Text(
                  'Total de nomes deixados pelos clientes:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Text(
                  resultadosAbertasContatos['qtdNome'].toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              ListTile(
                title: Text(
                  'Total de comentários deixados pelos clientes:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Text(
                  resultadosAbertasContatos['qtdRespostaAberta'].toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              ListTile(
                title: Text(
                  'Total de e-mails deixados pelos clientes:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Text(
                  resultadosAbertasContatos['qtdEmail'].toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              ListTile(
                title: Text(
                  'Total de telefones deixados pelos clientes:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Text(
                  resultadosAbertasContatos['qtdTelefone'].toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              Divider(
                height: 30,
                color: Colors.purpleAccent,
                thickness: 4,
                endIndent: 25,
                indent: 25,
              ),
              Text(
                'Comentários deixados pelos clientes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: respostasDetalhadasAbertasContatos.map((element) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        right: 5, top: 5, left: 5, bottom: 5),
                    padding: const EdgeInsets.only(
                        top: 25, bottom: 25, left: 25, right: 5),
                    decoration: const BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      borderRadius: BorderRadius.all(Radius.circular(55.0) //
                          ),
                    ),
                    child: element.isEmpty
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                //Carregando nome
                                if (element['nome'] != null)
                                  Text('Nome: ' + element['nome'].toString(),
                                      style: const TextStyle(fontSize: 20)),
                                if (element['nome'] == null)
                                  Text('Nome: ' + 'Não se identificou',
                                      style: const TextStyle(fontSize: 20)),
                                //Carregando telefone
                                if (element['telefone'] != null)
                                  Text(
                                      'Telefone: ' +
                                          element['telefone'].toString(),
                                      style: const TextStyle(fontSize: 20)),
                                if (element['telefone'] == null)
                                  Text('Telefone: ' + 'Não deixou o número',
                                      style: const TextStyle(fontSize: 20)),
                                //Carregando email
                                if (element['email'] != null)
                                  Text('Email: ' + element['email'].toString(),
                                      style: const TextStyle(fontSize: 20)),
                                if (element['email'] == null)
                                  Text('Email: ' + 'Não deixou o email',
                                      style: const TextStyle(fontSize: 20)),
                                //Carregando resposta aberta
                                Text(
                                  'Resposta deixada: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                if (element['comentario'] != null)
                                  Text(
                                    element['comentario'].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w700),
                                  ),
                                if (element['comentario'] == null)
                                  Text(
                                    'Não deixou resposta',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700),
                                  )
                              ]),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void salvarPerguntasQuestionario(Map<String, dynamic> questionarioJson) {
    questionarioJson.forEach((key, value) {
      //assume todos os valores
      value.map((e) {
        if (e['id'] == '1') {
          perguntaNps = Nps.fromJson(e);
        }
        if (e['id'] == '2') {
          perguntasMultiplasOpcoes = MultiplasOpcoes.fromJson(e);
        }
        if (e['id'] == '3') {
          perguntasMultiplasOpcoes3emotions =
              MultiplasOpcoes3emotions.fromJson(e);
        }
        if (e['id'] == '5') {
          perguntaRespostaAbertaContato = RespostaAbertaContato.fromJson(e);
        }
      }).toList();
    });
    setState(() {});
  }

  void salvarListaRespostas(Map<String, dynamic> respostasJson) {
    respostasJson.forEach((key, value) {
      //assume todos os valores
      value.map((e) {
        if (e['id'] == '1') {
          respostasNps.add(Nps.fromJson(e));
        }
        if (e['id'] == '2') {
          respostasMultiplasOpcoes.add(MultiplasOpcoes.fromJson(e));
        }
        if (e['id'] == '3') {
          respostasMultiplasOpcoes3emotions
              .add(MultiplasOpcoes3emotions.fromJson(e));
        }
        if (e['id'] == '5') {
          respostasRespostaAbertaContato.add(RespostaAbertaContato.fromJson(e));
        }
      }).toList();
    });
    setState(() {});
  }

  void calcularRespostasNPS() {
    //print(respostasNps.length.toString());
    //resultadosNPS.clear();
    for (var elemento in respostasNps) {
      if (elemento.resposta == '0') {
        resultadosNPS['nps0']++;
      }
      if (elemento.resposta == '1') {
        resultadosNPS['nps1']++;
      }
      if (elemento.resposta == '2') {
        resultadosNPS['nps2']++;
      }
      if (elemento.resposta == '3') {
        resultadosNPS['nps3']++;
      }
      if (elemento.resposta == '4') {
        resultadosNPS['nps4']++;
      }
      if (elemento.resposta == '5') {
        resultadosNPS['nps5']++;
      }
      if (elemento.resposta == '6') {
        resultadosNPS['nps6']++;
      }
      if (elemento.resposta == '7') {
        resultadosNPS['nps7']++;
      }
      if (elemento.resposta == '8') {
        resultadosNPS['nps8']++;
      }
      if (elemento.resposta == '9') {
        resultadosNPS['nps9']++;
      }
      if (elemento.resposta == '10') {
        resultadosNPS['nps10']++;
      }
    }
    resultadosNPS['tituloQuestao'] = perguntaNps.tituloQuestao.toString();
    setState(() {});

    //print('resultados.toString() = ' + resultadosNPS.toString());
  }

  void calcularRespostasMultiplasOpcoes() {
    List<PerguntasBinarias>? listaPerguntas =
        perguntasMultiplasOpcoes.perguntas;
    //Carregar questões
    resultadosPerguntasOpcoes.clear();
    for (var pergunta in listaPerguntas!) {
      resultadosPerguntasOpcoes.add({
        'state': true,
        'questao': pergunta.questao.toString(),
        'qtdRespostas': 0,
      });
    }

    resultadosPerguntasOpcoes.map((element) {
      for (var objetoRespostas in respostasMultiplasOpcoes) {
        for (var perguntas in objetoRespostas.perguntas!) {
          if (element['questao'] == perguntas.questao) {
            if (perguntas.state!) {
              element['qtdRespostas']++;
            }
          }
        }
      }
    }).toList();

    setState(() {});
  }

  void calcularRespostasMultiplas3Emotions() {
    List<PerguntasEmotions>? listaPerguntas3emotions =
        perguntasMultiplasOpcoes3emotions.perguntas;

    //Carregar questões
    resultados3emotion.clear();
    for (var pergunta in listaPerguntas3emotions!) {
      resultados3emotion.add({
        'questao': pergunta.questao.toString(),
        'qtdPessimo': 0,
        'qtdRazoavel': 0,
        'qtdExcelente': 0,
      });
    }

    resultados3emotion.map((element) {
      for (var objetoRespostas in respostasMultiplasOpcoes3emotions) {
        for (var perguntas in objetoRespostas.perguntas!) {
          if (element['questao'] == perguntas.questao) {
            if (perguntas.pessimo!) {
              element['qtdPessimo']++;
            }
            if (perguntas.razoavel!) {
              element['qtdRazoavel']++;
            }
            if (perguntas.excelente!) {
              element['qtdExcelente']++;
            }
          }
        }
      }
    }).toList();

    setState(() {});
  }

  void calcularRespostasAbertasContatos() {
    for (var elemento in respostasRespostaAbertaContato) {
      if (elemento.nomeCliente != null && elemento.nomeCliente != "") {
        resultadosAbertasContatos['qtdNome']++;
      }
      if (elemento.repostaAberta != null && elemento.repostaAberta != "") {
        resultadosAbertasContatos['qtdRespostaAberta']++;
      }
      if (elemento.telefoneCliente != null && elemento.telefoneCliente != "") {
        resultadosAbertasContatos['qtdTelefone']++;
      }
      if (elemento.emailCliente != null && elemento.emailCliente != "") {
        resultadosAbertasContatos['qtdEmail']++;
      }
    }
    setState(() {});
  }

  void carregarRespostasAbertasEContatos() {
    respostasDetalhadasAbertasContatos.clear();
    for (var elemento in respostasRespostaAbertaContato) {
      if (elemento.repostaAberta != "") {
        respostasDetalhadasAbertasContatos.add({
          'comentario': elemento.repostaAberta.toString(),
          // 'telefone': elemento.telefoneCliente.toString(),
          // 'email': elemento.emailCliente.toString(),
          // 'nome': elemento.nomeCliente.toString()
        });
      }
      //Novas implementações
      if (elemento.emailCliente != "") {
        respostasDetalhadasAbertasContatos
            .add({'email': elemento.emailCliente.toString()});
      }
      if (elemento.repostaAberta != "") {
        respostasDetalhadasAbertasContatos.add({
          'telefone': elemento.telefoneCliente.toString(),
        });
      }
      if (elemento.telefoneCliente != "") {
        respostasDetalhadasAbertasContatos
            .add({'telefone': elemento.telefoneCliente.toString()});
      }
      if (elemento.nomeCliente != "") {
        respostasDetalhadasAbertasContatos
            .add({'nome': elemento.nomeCliente.toString()});
      }
    }
    setState(() {});
  }

  void limparVariaveis() {
    respostasJson = {};
    respostas = [];

    perguntaNps = Nps();
    perguntasMultiplasOpcoes = MultiplasOpcoes();
    perguntasMultiplasOpcoes3emotions = MultiplasOpcoes3emotions();
    perguntaRespostaAbertaContato = RespostaAbertaContato();

    respostasNps = [];
    respostasMultiplasOpcoes = [];
    perguntasBinarias = [];
    respostasMultiplasOpcoes3emotions = [];
    respostasRespostaAbertaContato = [];

    //late ResultadoQtd3Emotions resultadoQtd3Emotion;
    resultadosNPS = {
      'tituloQuestao': '1 - Carregando...',
      'nps0': 0,
      'nps1': 0,
      'nps2': 0,
      'nps3': 0,
      'nps4': 0,
      'nps5': 0,
      'nps6': 0,
      'nps7': 0,
      'nps8': 0,
      'nps9': 0,
      'nps10': 0
    };
    resultadosPerguntasOpcoes = [];
    resultados3emotion = [];
    resultadosAbertasContatos = {
      'qtdTelefone': 0,
      'qtdEmail': 0,
      'qtdRespostaAberta': 0,
      'qtdNome': 0
    };
    respostasDetalhadasAbertasContatos = [];
  }
}

Widget construirNps(
    {required String valor,
    required String quantidade,
    required bool selecionado}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: EdgeInsets.all(8),
        child: Text(
          valor,
          style: TextStyle(fontSize: 20),
        ),
      ),
      Text(
        quantidade,
        style: TextStyle(
            fontSize: 20, color: Colors.green, fontWeight: FontWeight.w700),
      ),
    ],
  );
}

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

// Uri urlRespostas = Uri.https("apifirabase-default-rtdb.firebaseio.com",
//     "/respostas_${NomeQuestionarioGlobal.name}.json");

Uri urlRespostas = Uri.https("apifirabase-default-rtdb.firebaseio.com",
    "/respostas_Questionário totem entrada.json");
