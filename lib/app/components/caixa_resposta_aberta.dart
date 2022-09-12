// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class RespostaAberta extends StatelessWidget {
  const RespostaAberta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPadding: const EdgeInsets.all(10.0),
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        labelText: 'Digite seu comentário',
        contentPadding: EdgeInsets.symmetric(vertical: 30), //
      ),
      style: const TextStyle(fontSize: 40),
      maxLines: 50, // <-- SEE HERE
      minLines: 2, // <-- SEE HERE
    );
  }
}
