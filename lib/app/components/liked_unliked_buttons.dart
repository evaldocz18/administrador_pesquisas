import 'package:flutter/material.dart';

class LikedUnlikedButton extends StatelessWidget {
  const LikedUnlikedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 27),
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: const BoxDecoration(
        //color: Color(0xFF135A83),
        borderRadius: BorderRadius.all(Radius.circular(55.0) //
            ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 20),
              width: 300,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(55.0)),
              ),
              child: TextButton.icon(
                style: ButtonStyle(
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 50)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                icon: const Icon(Icons.thumb_up_alt,
                    size: 50, color: Colors.white),
                label: const Text(
                  'SIM',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/multiplas_opcoes');
                },
              )),
          Container(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            width: 300,
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(55.0)),
            ),
            child: TextButton.icon(
              style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 50)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              icon: const Icon(Icons.thumb_down_alt,
                  size: 50, color: Colors.white),
              label: const Text(
                'NÃO',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/resposta_aberta');
              },
            ),
          ),
        ],
      ),
    );
  }
}
