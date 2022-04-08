// ignore_for_file: avoid_print, prefer_const_constructors, unnecessary_import, deprecated_member_use, duplicate_ignore, use_key_in_widget_constructors
// ignore: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questao.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é sua cor favorita?',
      'Qual é o seu animal favorito',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: _responder,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: _responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: _responder,
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
