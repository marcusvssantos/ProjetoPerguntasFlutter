import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario, {Key? key})
      : super(key: key);

  String get fraseResultado {
    if (pontuacao < 1) {
      return 'Tu é Burro!';
    } else if (pontuacao >= 1 && pontuacao < 2) {
      return 'Tu é Meio Burro!';
    } else if (pontuacao >= 2 && pontuacao < 3) {
      return 'Da pro Gasto!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
