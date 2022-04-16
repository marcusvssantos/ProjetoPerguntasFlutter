import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a Linguagem de Programação mais usada em 2021?',
      'respostas': [
        {'texto': 'Java', 'pontuacao': 0},
        {'texto': 'Python', 'pontuacao': 1},
        {'texto': 'C++', 'pontuacao': 0},
        {'texto': 'JavaScript', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual a data de lançamento do Java??',
      'respostas': [
        {'texto': '1995', 'pontuacao': 1},
        {'texto': '1968', 'pontuacao': 0},
        {'texto': '2001', 'pontuacao': 0},
        {'texto': '1925', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem foi o criador da Lâmpada?',
      'respostas': [
        {'texto': 'Elon Musk', 'pontuacao': 0},
        {'texto': 'Nikola Tesla', 'pontuacao': 0},
        {'texto': 'Thomas Edison', 'pontuacao': 1},
        {'texto': 'Isaac Newton', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
