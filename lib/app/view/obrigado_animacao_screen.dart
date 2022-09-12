// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures
import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vivo_help/app/splash_screen.dart';
import 'package:vivo_help/utils/instance.dart';
import '../components/animacao_avatar.dart';
import 'package:http/http.dart' as http;

class ObrigadoAnimacaoScreen extends StatefulWidget {
  const ObrigadoAnimacaoScreen({Key? key}) : super(key: key);

  @override
  State<ObrigadoAnimacaoScreen> createState() => _ObrigadoAnimacaoScreen();
}

class _ObrigadoAnimacaoScreen extends State<ObrigadoAnimacaoScreen> {
  late SharedPreferences _prefs;
  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    salvarFirebase();
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void salvarFirebase() async {
    Uri url = Uri.https("apifirabase-default-rtdb.firebaseio.com",
        "/respostas_${NomeQuestionarioGlobal.name}.json");
    final response =
        await http.post(url, body: json.encode(ListaTelasGlobbal.infoJson));

    if (response.statusCode == 201) {
      print('Não salvou no Firebase');
    } else {
      //salvarLocalmente();
      print('Salvou no Firebase');
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer? tempo;
    tempo = Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    });

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/vivo-help.appspot.com/o/3_emotions_imagem_do_agradecimento.png?alt=media&token=3d9b838c-8603-452c-94bf-2adc33b2893d",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            ConfettiWidget(
              confettiController: controller,
              shouldLoop: true,
            ),
            Expanded(
              flex: 2,
              child: AnimationAvatar(),
            ),
            Container(
                //width: 350,
                //height: 160,
                margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(55.0)),
                ),
                child: TextButton.icon(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  icon:
                      const Icon(Icons.favorite, size: 100, color: Colors.pink),
                  label: const Text(
                    'Obrigado sua opnião é muito importante para nós!',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }

  Future<void> salvarLocalmente() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('respostas', ListaTelasGlobbal.infoJson.toString());
    //print(_prefs.getString('respostas'));
  }
}
