import 'package:flutter/material.dart';

import '../../utils/chamar_tela.dart';

class AlertaTempoMensagem extends StatefulWidget {
  const AlertaTempoMensagem({Key? key}) : super(key: key);
  @override
  State<AlertaTempoMensagem> createState() => _AlertaTempoMensagem();
}

class _AlertaTempoMensagem extends State<AlertaTempoMensagem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: TextButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: const Text('Show Dialog'),
      ),
    );
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool reiniciarQuestionario() {
    Navigator.pop(context);
    return true;
  }
}
