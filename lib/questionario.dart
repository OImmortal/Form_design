import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> pergunta;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario(
      {required this.pergunta,
      required this.perguntaSelecionada,
      required this.responder,
      super.key});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? pergunta[perguntaSelecionada]['resposta'] as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(pergunta[perguntaSelecionada]['texto']!.toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () {
              responder(resp['pontuacao'] as int);
            },
          );
        }).toList(),
      ],
    );
  }
}
