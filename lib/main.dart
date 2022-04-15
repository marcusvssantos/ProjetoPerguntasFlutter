import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

final _perguntas = const [
  {
    'texto': 'Qual é a sua cor favorita?',
    'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
  },
  {
    'texto': 'Qual é o seu animal favorito?',
    'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
  },
  {
    'texto': 'Qual é o seu instrutor favorito?',
    'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
  }
];

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
            : null,
      ),
    );
  }
}
