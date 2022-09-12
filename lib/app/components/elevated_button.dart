import 'package:flutter/material.dart';

class ElevatedBotao extends StatelessWidget {
  final Color cor;
  final String texto;

  const ElevatedBotao({Key? key, required this.cor, required this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 200),
        textStyle: const TextStyle(fontSize: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              50.0), /*side: BorderSide(color: Colors.red)*/
        ),
        primary: cor,
      ).copyWith(elevation: ButtonStyleButton.allOrNull(50.0)),
      onPressed: () {},
      child: Text(texto),
      
    );
  }
}
