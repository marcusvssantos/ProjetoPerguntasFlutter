// ignore_for_file: avoid_print, prefer_const_constructors, unnecessary_import, deprecated_member_use, duplicate_ignore, use_key_in_widget_constructors
// ignore: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  void responder() {
    print('Pergunta Respondida');
  }

  void Function() funcaoQueRetornaUmaOutraFuncao() {
    return () {
      print('Pergunta Respondida #02!');
    };
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
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
            Text(perguntas.elementAt(0)),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: funcaoQueRetornaUmaOutraFuncao(),
            ),
          ],
        ),
      ),
    );
  }
}
