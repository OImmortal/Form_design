import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  final List<Map<String, Object>> _pergunta = const [
    {
      'texto': "Pergunta 1",
      'resposta': [
        {'texto': 'a) Resposta Correta', 'pontuacao': 10},
        {'texto': 'b) Resposta Errada', 'pontuacao': 0},
        {'texto': 'c) Resposta Errada', 'pontuacao': 0},
        {'texto': 'd) Resposta Errada', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Pergunta 2',
      'resposta': [
        {'texto': 'a) Resposta Errada', 'pontuacao': 0},
        {'texto': 'b) Resposta Errada', 'pontuacao': 0},
        {'texto': 'c) Resposta Correta', 'pontuacao': 10},
        {'texto': 'd) Resposta Errada', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Pergunta 3',
      'resposta': [
        {'texto': 'a) Resposta Errada', 'pontuacao': 0},
        {'texto': 'b) Resposta Correta', 'pontuacao': 10},
        {'texto': 'c) Resposta Errada', 'pontuacao': 0},
        {'texto': 'd) Resposta Errada', 'pontuacao': 0},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Perguntas"),
          backgroundColor: Colors.amber[800],
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                pergunta: _pergunta,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : TelaFinal(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
