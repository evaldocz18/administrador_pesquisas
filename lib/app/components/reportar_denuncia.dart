import 'package:flutter/material.dart';
import 'package:vivo_help/app/database/http_database.dart';

class ButtonReportPrejudice extends StatelessWidget {
  const ButtonReportPrejudice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(55.0)),
          ),
          child: TextButton.icon(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: constraints.maxWidth / 15)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            icon: Icon(Icons.campaign_outlined,
                size: constraints.maxWidth / 4, color: Colors.white),
            label: const Text(
              'SIM EU SOFRI PRECONCEITO',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              // Navigator.of(context).pushNamed('/resposta_aberta');

              HttpDatabase.adicionar({});
            },
          ));
    });
  }
}
